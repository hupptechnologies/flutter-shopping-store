import {
	Body,
	Controller,
	Delete,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
	Query,
} from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Voucher } from './entities/voucher.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateVoucherDto } from './dto/create-voucher.dto';
import { KeyConstant } from 'src/common/constant/key.constant';
import { UpdateVoucherDto } from './dto/update-voucher.dto';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';
import { PaginationRes } from 'src/common/interface/pagination-res.interface';

@Controller(URLConstant.VOUCHER)
export class VoucherController {
	constructor(private readonly voucherService: VoucherService) {}

	@Post()
	public async create(@Body() dto: CreateVoucherDto): APIResponse<Voucher> {
		const voucher = await this.voucherService.create(dto);
		return {
			data: voucher,
			message: MessageConstant.VOUCHER_CREATED_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	public async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() dto: UpdateVoucherDto,
	): APIResponse<Voucher> {
		const voucher = await this.voucherService.update(id, dto);
		return {
			data: voucher,
			message: MessageConstant.VOUCHER_UPDATED_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	public async findById(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<Voucher> {
		const voucher = await this.voucherService.findById(id);
		return {
			data: voucher,
			message: MessageConstant.VOUCHER_FOUND_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	public async delete(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<boolean> {
		const isDeleted = await this.voucherService.delete(id);
		return {
			data: isDeleted,
			message: MessageConstant.VOUCHER_DELETED_SUCCESS,
		};
	}

	@Get()
	public async findAll(@Query() query: QueryOptionsDto): APIResponse<PaginationRes<Voucher>> {
		const vouchers = await this.voucherService.findAll(query);
		return {
			data: vouchers,
			message: MessageConstant.VOUCHERS_FETCHED_SUCCESS,
		};
	}
}
