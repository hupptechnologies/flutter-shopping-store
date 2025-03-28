import { Injectable } from '@nestjs/common';
import { JwtModuleOptions } from '@nestjs/jwt';
import { AppConfigService } from './app/app-config.service';
import { KeyConstant } from '../common/constant/key.constant';

@Injectable()
export class JWTConfigService {
	constructor(private readonly appConfigService: AppConfigService) {}

	createJwtOptions(): JwtModuleOptions {
		return {
			global: true,
			secret: this.appConfigService.jwtSecret,
			signOptions: {
				expiresIn: KeyConstant.ACCESS_TOKEN_EXPIRES,
			},
		};
	}
}
