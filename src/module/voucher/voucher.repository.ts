import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Voucher } from './entities/voucher.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateVoucherDto } from './dto/create-voucher.dto';
import { UpdateVoucherDto } from './dto/update-voucher.dto';

@Loggable()
@Injectable()
export class VoucherRepository {
	constructor(
		@InjectRepository(Voucher)
		private readonly repository: Repository<Voucher>,
	) {}

	public async findByCode(code: string): Promise<Voucher | null> {
		return await this.repository.findOne({
			where: {
				code,
			},
		});
	}

	public async create(dto: CreateVoucherDto): Promise<Voucher> {
		const voucher = this.repository.create(dto);
		return await this.repository.save(voucher);
	}

	public async update(voucher: Voucher, dto: UpdateVoucherDto): Promise<Voucher> {
		Object.assign(voucher, dto);
		return await this.repository.save(voucher);
	}

	public async findById(id: number): Promise<Voucher | null> {
		return await this.repository.findOne({
			where: {
				id,
			},
		});
	}

	public async delete(voucher: Voucher, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const deleteVoucher = await voucher.softRemove();
			return !!deleteVoucher;
		}
		const deleteVoucher = await voucher.remove();
		return !!deleteVoucher;
	}
}
