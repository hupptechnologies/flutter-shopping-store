import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Otp } from 'src/module/auth/entities/otp.entity';
import { OtpRepository } from './otp.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Otp])],
	providers: [OtpRepository],
	exports: [OtpRepository],
})
export class OtpRepoModule {}
