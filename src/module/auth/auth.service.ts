import { Injectable, UnauthorizedException } from '@nestjs/common';
import { LoginAuthDto } from './dto/login-auth.dto';
import { Response } from 'express';
import { User } from '../user/entities/user.entity';
import { UserRepository } from '../user/user.repository';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { JWTPayload } from 'src/common/interface/jwt.interface';
import { JwtService } from '@nestjs/jwt';
import { KeyConstant } from 'src/common/constant/key.constant';

@Injectable()
export class AuthService {
	constructor(
		private readonly userRepository: UserRepository,
		private readonly bcryptService: BcryptService,
		private readonly jwtService: JwtService,
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
			userName: existingUser.userName,
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
}
