import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';
import { APP_GUARD } from '@nestjs/core';
import { UserModule } from '../user/user.module';
import { OtpUtils } from '../../common/utils/otp.utils';
import { AppConfigModule } from '../../config/app/app-config.module';
import { JWTConfigService } from '../../config/jwt.config';
import { AuthGuard } from '../../guard/auth/auth.guard';
import { OtpRepoModule } from '../../repository/otp/otp-repo.module';
import { UserRepoModule } from '../../repository/user/user-repo.module';
import { MailModule } from '../../services/mail/mail.module';

@Module({
	imports: [
		OtpRepoModule,
		UserRepoModule,
		UserModule,
		MailModule,
		JwtModule.registerAsync({
			imports: [AppConfigModule],
			useClass: JWTConfigService,
		}),
	],
	controllers: [AuthController],
	providers: [
		AuthService,
		OtpUtils,
		{
			provide: APP_GUARD,
			useClass: AuthGuard,
		},
	],
	exports: [AuthService],
})
export class AuthModule {}
