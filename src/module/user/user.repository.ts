import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';

export class UserRepository {
	constructor(
		@InjectRepository(User)
		private readonly repository: Repository<User>,
	) {}

	public async create(createUserDto: CreateUserDto): Promise<User> {
		const user = this.repository.create(createUserDto);
		return this.repository.save(user);
	}
}
