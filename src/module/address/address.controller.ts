import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { AddressService } from './address.service';
import { CreateAddressDto } from './dto/create-address.dto';
import { Address } from './entities/address.entity';
import { User } from '../user/entities/user.entity';
import { UpdateAddressDto } from './dto/update-address.dto';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { APIResponse } from '../../common/types/api-response.type';
import { AuthUserId } from '../../decorator/auth-user-id/auth-user-id.decorator';
import { AuthUser } from '../../decorator/auth-user/auth-user.decorator';

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
		@AuthUserId() userId: number,
	): APIResponse<Address> {
		const address = await this.addressService.update(id, updataAddressDto, userId);
		return {
			data: address,
			message: MessageConstant.ADDRESS_UPDATE_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	async findById(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@AuthUserId() userId: number,
	): APIResponse<Address> {
		const address = await this.addressService.findById(id, userId);
		return {
			data: address,
			message: MessageConstant.ADDRESS_FOUND_SUCCESS,
		};
	}

	@Get()
	async findAll(@AuthUserId() userId: number): APIResponse<Array<Address>> {
		const addresses = await this.addressService.findAll(userId);
		return {
			data: addresses,
			message: MessageConstant.ADDRESSES_FETCHED_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@AuthUserId() userId: number,
	): APIResponse<boolean> {
		const isDeleted = await this.addressService.delete(id, userId);
		return {
			data: isDeleted,
			message: MessageConstant.ADDRESS_DELETED_SUCCESS,
		};
	}
}
