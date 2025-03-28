import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { OtpRepository } from './otp.repository';
import { Otp } from '../../module/auth/entities/otp.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Otp])],
	providers: [OtpRepository],
	exports: [OtpRepository],
})
export class OtpRepoModule {}
