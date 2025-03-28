import { Injectable } from '@nestjs/common';
import { Address } from '../../module/address/entities/address.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateAddressDto } from '../../module/address/dto/create-address.dto';
import { User } from '../../module/user/entities/user.entity';
import { UpdateAddressDto } from '../../module/address/dto/update-address.dto';
import { BaseRepository } from '../base.respository';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class AddressRepository extends BaseRepository {
	constructor(
		@InjectRepository(Address)
		private readonly repository: Repository<Address>,
	) {
		super();
	}

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
}
