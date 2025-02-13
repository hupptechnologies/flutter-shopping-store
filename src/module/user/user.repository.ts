import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Injectable } from '@nestjs/common';

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
}
