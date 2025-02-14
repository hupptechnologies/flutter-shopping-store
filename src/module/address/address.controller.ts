import { Body, Controller, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { AddressService } from './address.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { CreateAddressDto } from './dto/create-address.dto';
import { Address } from './entities/address.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { UpdateAddressDto } from './dto/update-address.dto';
import { KeyConstant } from 'src/common/constant/key.constant';
import { APIResponse } from 'src/common/types/api-response.type';

@Controller(URLConstant.ADDRESS)
export class AddressController {
	constructor(private readonly addressService: AddressService) {}

	@Post()
	async create(
		@Body() createAddressDto: CreateAddressDto,
		@AuthUser() authUser: User,
	): APIResponse<Address> {
		const address = await this.addressService.create(createAddressDto, authUser);
		return {
			data: address,
			message: MessageConstant.ADDRESS_CREATED_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updataAddressDto: UpdateAddressDto,
		@AuthUser() authUser: User,
	): APIResponse<Address> {
		const address = await this.addressService.update(id, updataAddressDto, authUser.id);
		return {
			data: address,
			message: MessageConstant.ADDRESS_UPDATE_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	async findById(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<Address> {
		const address = await this.addressService.findById(id);
		return {
			data: address,
			message: MessageConstant.ADDRESS_FOUND_SUCCESS,
		};
	}
}
