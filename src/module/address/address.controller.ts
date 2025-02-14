import { Body, Controller, Post } from '@nestjs/common';
import { AddressService } from './address.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { CreateAddressDto } from './dto/create-address.dto';
import { Address } from './entities/address.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';

@Controller(URLConstant.ADDRESS)
export class AddressController {
	constructor(private readonly addressService: AddressService) {}

	@Post()
	async create(
		@Body() createAddressDto: CreateAddressDto,
		@AuthUser() authUser: User,
	): Promise<ApiResponse<Address>> {
		const address = await this.addressService.create(createAddressDto, authUser);
		return {
			data: address,
			message: MessageConstant.ADDRESS_CREATED_SUCCESS,
		};
	}
}
