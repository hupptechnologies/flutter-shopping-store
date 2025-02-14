import { Injectable } from '@nestjs/common';
import { CreateAddressDto } from './dto/create-address.dto';
import { Address } from './entities/address.entity';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { AddressRepository } from './address.repository';
import { User } from '../user/entities/user.entity';

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
}
