import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository } from 'typeorm';
import { User } from '../../module/user/entities/user.entity';
import { CreateUserDto } from '../../module/user/dto/create-user.dto';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Injectable } from '@nestjs/common';
import { UpdateUserDto } from '../../module/user/dto/update-user.dto';
import { RelationKeys } from 'src/common/types/relations.type';
import { BaseRepository } from '../base.respository';

@Loggable()
@Injectable()
export class UserRepository extends BaseRepository {
	constructor(
		@InjectRepository(User)
		private readonly repository: Repository<User>,
	) {
		super();
	}

	public async create(createUserDto: CreateUserDto): Promise<User> {
		const user = this.repository.create(createUserDto);
		return this.repository.save(user);
	}

	public async findOnByEmail(email: string): Promise<User | null> {
		return this.repository.findOneBy({
			email,
		});
	}

	public async findOnByEmailAndNotId(id: number, email: string): Promise<User | null> {
		return this.repository.findOne({
			where: {
				email,
				id: Not(id),
			},
		});
	}

	public async findOneById(id: number, relations?: RelationKeys<User>): Promise<User | null> {
		return this.repository.findOne({
			where: {
				id,
			},
			relations,
		});
	}

	public async update(user: User, updateUserDto: UpdateUserDto): Promise<User> {
		Object.assign(user, updateUserDto);
		return this.repository.save(user);
	}
}
