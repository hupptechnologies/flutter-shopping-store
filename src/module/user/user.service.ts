import { Injectable } from '@nestjs/common';
import { User } from './entities/user.entity';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';

@Loggable()
@Injectable()
export class UserService {
	constructor(
		private readonly bcryptService: BcryptService,
		private readonly userRepository: UserRepository,
		private readonly cloudinaryService: CloudinaryService,
	) {}

	public async create(createUserDto: CreateUserDto, file: Express.Multer.File): Promise<User> {
		const password = createUserDto.password;
		createUserDto.password = await this.bcryptService.hashPassword(password);

		const uploadFile = await this.cloudinaryService.uploadFile(file);
		createUserDto.image = uploadFile?.public_id;

		const user = await this.userRepository.create(createUserDto);

		user.image = uploadFile?.url;
		return user;
	}
}
