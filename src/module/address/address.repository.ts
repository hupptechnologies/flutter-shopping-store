import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Address } from './entities/address.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateAddressDto } from './dto/create-address.dto';
import { User } from '../user/entities/user.entity';
import { UpdateAddressDto } from './dto/update-address.dto';

@Loggable()
@Injectable()
export class AddressRepository {
	constructor(
		@InjectRepository(Address)
		private readonly repository: Repository<Address>,
	) {}

	async create(createAddressDto: CreateAddressDto, user: User): Promise<Address> {
		const create = this.repository.create(createAddressDto);
		create.user = user;
		return this.repository.save(create);
	}

	async updateUserIdToIsDefault(userId: number): Promise<boolean> {
		const { affected } = await this.repository.update(
			{
				user: {
					id: userId,
				},
			},
			{
				isDefault: false,
			},
		);
		return !!affected;
	}

	async findById(id: number): Promise<Address | null> {
		return this.repository.findOneBy({
			id,
		});
	}

	async update(address: Address, updateAddressDto: UpdateAddressDto): Promise<Address> {
		Object.assign(address, updateAddressDto);
		return this.repository.save(address);
	}
}
