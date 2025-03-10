import { Body, Controller, Post } from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Voucher } from './entities/voucher.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateVoucherDto } from './dto/create-voucher.dto';

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
}
