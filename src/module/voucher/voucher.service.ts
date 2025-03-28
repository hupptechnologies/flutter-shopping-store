import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { QueryOptionsDto } from '../../common/dto/query-options.dto';
import { PaginationRes } from '../../common/interface/pagination-res.interface';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { VoucherRepository } from '../../repository/voucher/voucher.repository';
import { CreateVoucherDto } from './dto/create-voucher.dto';
import { UpdateVoucherDto } from './dto/update-voucher.dto';
import { Voucher } from './entities/voucher.entity';

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
			throw new NotFoundException(MessageConstant.VOUCHER_NOT_FOUND);
		}

		delete dto.code;
		const updateVoucher = await this.repository.update(voucher, dto);
		return updateVoucher;
	}

	public async findById(id: number): Promise<Voucher> {
		const voucher = await this.repository.findById(id);

		if (!voucher) {
			throw new NotFoundException(MessageConstant.VOUCHER_NOT_FOUND);
		}

		return voucher;
	}

	public async delete(id: number): Promise<boolean> {
		const voucher = await this.repository.findById(id);

		if (!voucher) {
			throw new NotFoundException(MessageConstant.VOUCHER_NOT_FOUND);
		}

		const isDeleted = await this.repository.delete(voucher);
		return isDeleted;
	}

	public async findAll(queryOptionsDto: QueryOptionsDto): Promise<PaginationRes<Voucher>> {
		const { items, total } = await this.repository.findAll(queryOptionsDto);
		queryOptionsDto.setTotal(total);
		return {
			items,
			meta: queryOptionsDto,
		};
	}
}
