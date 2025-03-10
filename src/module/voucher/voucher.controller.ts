import { Controller } from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { URLConstant } from 'src/common/constant/url.constant';

@Controller(URLConstant.VOUCHER)
export class VoucherController {
	constructor(private readonly voucherService: VoucherService) {}
}
