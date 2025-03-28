import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Otp } from '../../module/auth/entities/otp.entity';
import { Repository } from 'typeorm';
import { User } from '../../module/user/entities/user.entity';
import { BaseRepository } from '../base.respository';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class OtpRepository extends BaseRepository {
	constructor(
		@InjectRepository(Otp)
		private readonly repository: Repository<Otp>,
	) {
		super();
	}

	async create(user: User, otp: number, expiresAt: number): Promise<Otp> {
		const otpRecord = this.repository.create({
			user,
			otp,
			expiresAt,
			isVerify: false,
		});
		return this.repository.save(otpRecord);
	}

	async findOne(userId: number): Promise<Otp | null> {
		return this.repository.findOneBy({
			userId,
		});
	}

	async update(otpRecord: Otp): Promise<Otp> {
		return this.repository.save(otpRecord);
	}
}
