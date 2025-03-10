import { BadRequestException, Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Voucher } from './entities/voucher.entity';
import { CreateVoucherDto } from './dto/create-voucher.dto';
import { VoucherRepository } from './voucher.repository';
import { MessageConstant } from 'src/common/constant/message.constant';
import { UpdateVoucherDto } from './dto/update-voucher.dto';

@Injectable()
@Loggable()
export class VoucherService {
	constructor(private readonly repository: VoucherRepository) {}

	public async create(dto: CreateVoucherDto): Promise<Voucher> {
		const existsCode = await this.repository.findByCode(dto.code);

		if (existsCode) {
			throw new BadRequestException(MessageConstant.CODE_ALREADY_EXISTS);
		}

		const voucher = await this.repository.create(dto);
		return voucher;
	}

	public async update(id: number, dto: UpdateVoucherDto): Promise<Voucher> {
		const voucher = await this.repository.findById(id);

		if (!voucher) {
			throw new BadRequestException(MessageConstant.VOUCHER_NOT_FOUND);
		}

		delete dto.code;
		const updateVoucher = await this.repository.update(voucher, dto);
		return updateVoucher;
	}
}
