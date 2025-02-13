import { Body, Controller, HttpCode, HttpStatus, Post, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { LoginAuthDto } from './dto/login-auth.dto';
import { Public } from 'src/decorator/public/public.decorator';
import { MessageConstant } from 'src/common/constant/message.constant';
import { Response } from 'express';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';
import { User } from '../user/entities/user.entity';
import { CommonConstant } from 'src/common/constant/common.constant';

@Controller(URLConstant.AUTH)
export class AuthController {
	constructor(private readonly authService: AuthService) {}

	@Public()
	@HttpCode(HttpStatus.OK)
	@Post(URLConstant.LOGIN)
	async login(
		@Body() loginAuthDto: LoginAuthDto,
		@Res(CommonConstant.responseDecoratorOptions) res: Response,
	): Promise<ApiResponse<User>> {
		const existingUser = await this.authService.login(loginAuthDto, res);
		return {
			data: existingUser,
			message: MessageConstant.LOGIN_SUCCESS,
		};
	}
}
