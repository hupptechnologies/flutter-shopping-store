import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';
import { JWTConfigService } from 'src/config/jwt.config';
import { APP_GUARD } from '@nestjs/core';
import { AuthGuard } from 'src/guard/auth/auth.guard';
import { UserModule } from '../user/user.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../user/entities/user.entity';
import { Otp } from './entities/otp.entity';
import { OtpRepository } from './otp.repository';
import { OtpUtils } from 'src/common/utils/otp.utils';
import { MailModule } from 'src/services/mail/mail.module';
import { AppConfigModule } from 'src/config/app/app-config.module';

@Module({
	imports: [
		TypeOrmModule.forFeature([User, Otp]),
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
		OtpRepository,
		OtpUtils,
		{
			provide: APP_GUARD,
			useClass: AuthGuard,
		},
	],
	exports: [AuthService],
})
export class AuthModule {}
