import { Controller } from '@nestjs/common';
import { AddressService } from './address.service';
import { URLConstant } from 'src/common/constant/url.constant';

@Controller(URLConstant.ADDRESS)
export class AddressController {
	constructor(private readonly addressService: AddressService) {}
}
