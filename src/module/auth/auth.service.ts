import { Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { LoginAuthDto } from './dto/login-auth.dto';
import { Response } from 'express';
import { User } from '../user/entities/user.entity';
import { UserRepository } from '../user/user.repository';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { JWTPayload } from 'src/common/interface/jwt.interface';
import { JwtService } from '@nestjs/jwt';
import { KeyConstant } from 'src/common/constant/key.constant';
import { OtpRepository } from './otp.repository';
import { MessageConstant } from 'src/common/constant/message.constant';
import { OtpUtils } from 'src/common/utils/otp.utils';
import { MailService } from 'src/services/mail/mail.service';
import { MailSubjectConstant } from 'src/common/constant/mail-subject.constant';
import { TemplateConstant } from 'src/common/constant/template.constant';
import { VerifyOtpDto } from './dto/verify-otp.dto';
import { ErrorMsgConstant } from 'src/common/constant/error-msg.constant';

@Injectable()
export class AuthService {
	constructor(
		private readonly userRepository: UserRepository,
		private readonly bcryptService: BcryptService,
		private readonly jwtService: JwtService,
		private readonly otpRepository: OtpRepository,
		private readonly otpUtils: OtpUtils,
		private readonly mailService: MailService,
	) {}

	public async login(loginAuthDto: LoginAuthDto, res: Response): Promise<User> {
		const existingUser = await this.userRepository.findOnByEmail(loginAuthDto.email);

		if (!existingUser) {
			throw new UnauthorizedException();
		}

		const idValidPassword = await this.bcryptService.comparePassword(
			loginAuthDto.password,
			existingUser.password,
		);

		if (!idValidPassword) {
			throw new UnauthorizedException();
		}

		const playload: JWTPayload = {
			id: existingUser.id,
			email: existingUser.email,
		};

		const accessToken = this.jwtService.sign(playload);
		const refreshToken = this.jwtService.sign(playload, {
			expiresIn: KeyConstant.REFRESH_TOKEN_EXPIRES,
		});

		res.cookie(KeyConstant.ACCESS_TOKEN, accessToken, {
			httpOnly: true,
			maxAge: KeyConstant.ACCESS_TOKEN_MAX_AGE,
		});
		res.cookie(KeyConstant.REFRESH_TOKEN, refreshToken, {
			httpOnly: true,
			maxAge: KeyConstant.REFRESH_TOKEN_MAX_AGE,
		});

		return existingUser;
	}

	public async forgetPassword(email: string): Promise<string> {
		const user = await this.userRepository.findOnByEmail(email);

		if (!user) {
			throw new NotFoundException(MessageConstant.USER_NOT_FOUND);
		}

		const otp = this.otpUtils.generateTimeBasedOTP();
		const expiresAt = this.otpUtils.generateOtpExpireAt();

		await this.otpRepository.create(user, otp, expiresAt);

		void this.mailService.send({
			to: user.email,
			subject: MailSubjectConstant.OTP,
			template: TemplateConstant.OTP,
			context: {
				otp,
			},
		});
		return email;
	}

	public async verifyOtp(verifyOtpDto: VerifyOtpDto): Promise<VerifyOtpDto> {
		const user = await this.userRepository.findOnByEmail(verifyOtpDto.email);

		if (!user) {
			throw new NotFoundException(MessageConstant.USER_NOT_FOUND);
		}

		const otpRecord = await this.otpRepository.findOne(user.id);
		try {
			if (!otpRecord || otpRecord.otp !== verifyOtpDto.otp) {
				throw new NotFoundException(ErrorMsgConstant.INVALID_OTP);
			}

			if (Date.now() > otpRecord.expiresAt) {
				throw new NotFoundException(ErrorMsgConstant.OTP_EXPIRED);
			}

			otpRecord.isVerify = true;
			otpRecord.expiresAt = this.otpUtils.generateOtpExpireAt();
			await this.otpRepository.update(otpRecord);

			return verifyOtpDto;
		} catch (error) {
			if (otpRecord) {
				await this.otpRepository.delete(otpRecord);
			}
			throw error;
		}
	}
}
