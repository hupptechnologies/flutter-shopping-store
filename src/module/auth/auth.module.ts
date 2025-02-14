import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { ConfigModule } from '@nestjs/config';
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

@Module({
	imports: [
		ConfigModule,
		TypeOrmModule.forFeature([User, Otp]),
		UserModule,
		MailModule,
		JwtModule.registerAsync({
			imports: [ConfigModule],
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
