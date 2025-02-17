import { Body, Controller, HttpCode, HttpStatus, Post, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { LoginAuthDto } from './dto/login-auth.dto';
import { Public } from 'src/decorator/public/public.decorator';
import { MessageConstant } from 'src/common/constant/message.constant';
import { Response } from 'express';
import { User } from '../user/entities/user.entity';
import { CommonConstant } from 'src/common/constant/common.constant';
import { ForgetPasswordDto } from './dto/forget-password.dto';
import { APIResponse } from 'src/common/types/api-response.type';
import { VerifyOtpDto } from './dto/verify-otp.dto';
import { ResetPasswordDto } from './dto/reset-password.dto';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';

@Controller(URLConstant.AUTH)
export class AuthController {
	constructor(private readonly authService: AuthService) {}

	@Public()
	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.LOGIN)
	async login(
		@Body() loginAuthDto: LoginAuthDto,
		@Res(CommonConstant.responseDecoratorOptions) res: Response,
	): APIResponse<User> {
		const existingUser = await this.authService.login(loginAuthDto, res);
		return {
			data: existingUser,
			message: MessageConstant.LOGIN_SUCCESS,
		};
	}

	@Public()
	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.FORGET_PASSWORD)
	async forgetPassword(@Body() forgetPasswordDto: ForgetPasswordDto): APIResponse<string> {
		const email = await this.authService.forgetPassword(forgetPasswordDto.email);
		return {
			data: email,
			message: MessageConstant.OTP_SUCCESS,
		};
	}

	@Public()
	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.VERIFY_OTP)
	async verifyOtp(@Body() verifyOtpDto: VerifyOtpDto): APIResponse<VerifyOtpDto> {
		const verifyOtpRes = await this.authService.verifyOtp(verifyOtpDto);
		return {
			data: verifyOtpRes,
			message: MessageConstant.OTP_VERIFIED_SUCCESS,
		};
	}

	@Public()
	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.RESET_PASSWORD)
	async restPassword(@Body() resetPasswordDto: ResetPasswordDto): APIResponse<boolean> {
		const isResetPassword = await this.authService.resetPassword(resetPasswordDto);
		return {
			data: isResetPassword,
			message: MessageConstant.PASSWORD_RESET_SUCCESS,
		};
	}

	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.LOGOUT)
	logout(@Res(CommonConstant.responseDecoratorOptions) res: Response): ApiResponse<boolean> {
		const isLogOut = this.authService.logout(res);
		return {
			data: isLogOut,
			message: MessageConstant.LOGOUT_SUCCESS,
		};
	}
}
