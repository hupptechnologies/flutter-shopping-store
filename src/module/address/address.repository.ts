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

	async findById(id: number, userId: number): Promise<Address | null> {
		return this.repository.findOne({
			where: {
				id,
				user: {
					id: userId,
				},
			},
		});
	}

	async update(address: Address, updateAddressDto: UpdateAddressDto): Promise<Address> {
		Object.assign(address, updateAddressDto);
		return this.repository.save(address);
	}

	async findAll(userId: number): Promise<Array<Address>> {
		return this.repository.find({
			where: {
				user: {
					id: userId,
				},
			},
		});
	}

	async delete(address: Address, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const deleted = await address.softRemove();
			return !!deleted;
		}

		const deleted = await address.remove();
		return !!deleted;
	}
}
