import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtModuleOptions } from '@nestjs/jwt';
import { KeyConstant } from 'src/common/constant/key.constant';

@Injectable()
export class JWTConfigService {
	constructor(private readonly configSerivce: ConfigService) {}

	createJwtOptions(): JwtModuleOptions {
		return {
			global: true,
			secret: this.configSerivce.get(KeyConstant.ENV_JWT_SECRET_KEY),
			signOptions: {
				expiresIn: KeyConstant.ACCESS_TOKEN_EXPIRES,
			},
		};
	}
}
