import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateAddressDto } from './dto/create-address.dto';
import { Address } from './entities/address.entity';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { AddressRepository } from './address.repository';
import { User } from '../user/entities/user.entity';
import { UpdateAddressDto } from './dto/update-address.dto';
import { MessageConstant } from 'src/common/constant/message.constant';

@Loggable()
@Injectable()
export class AddressService {
	constructor(private readonly addressRepository: AddressRepository) {}

	public async create(createAddressDto: CreateAddressDto, authUser: User): Promise<Address> {
		await this.addressRepository.updateUserIdToIsDefault(authUser.id);

		const address = await this.addressRepository.create(createAddressDto, authUser);

		delete address.user;

		return address;
	}

	public async update(
		id: number,
		updataAddressDto: UpdateAddressDto,
		userId: number,
	): Promise<Address> {
		const address = await this.addressRepository.findById(id);

		if (!address) {
			throw new NotFoundException(MessageConstant.ADDRESS_NOT_FOUND);
		}

		if (updataAddressDto.isDefault) {
			await this.addressRepository.updateUserIdToIsDefault(userId);
		}

		return this.addressRepository.update(address, updataAddressDto);
	}
}
