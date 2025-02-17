import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Otp } from './entities/otp.entity';
import { Repository } from 'typeorm';
import { User } from '../user/entities/user.entity';

@Loggable()
@Injectable()
export class OtpRepository {
	constructor(
		@InjectRepository(Otp)
		private readonly repository: Repository<Otp>,
	) {}

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

	async delete(otpRecord: Otp): Promise<boolean> {
		const deleteRecord = await this.repository.remove(otpRecord);
		return !!deleteRecord;
	}
}
