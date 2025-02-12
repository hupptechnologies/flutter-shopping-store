import { Injectable } from '@nestjs/common';
import { User } from './entities/user.entity';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';

@Injectable()
export class UserService {
	constructor(
		private readonly bcryptService: BcryptService,
		private readonly userRepository: UserRepository,
	) {}

	public async create(createUserDto: CreateUserDto): Promise<User> {
		const password = createUserDto.password;
		createUserDto.password = await this.bcryptService.hashPassword(password);

		const user = await this.userRepository.create(createUserDto);
		return user;
	}
}
