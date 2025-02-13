import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Injectable } from '@nestjs/common';
import { UpdateUserDto } from './dto/update-user.dto';

@Loggable()
@Injectable()
export class UserRepository {
	constructor(
		@InjectRepository(User)
		private readonly repository: Repository<User>,
	) {}

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

	public async findOneById(id: number): Promise<User | null> {
		return this.repository.findOneBy({
			id,
		});
	}

	public async update(user: User, updateUserDto: UpdateUserDto): Promise<User> {
		Object.assign(user, updateUserDto);
		return this.repository.save(user);
	}
}
