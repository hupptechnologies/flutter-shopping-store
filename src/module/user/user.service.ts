import { Injectable, NotFoundException } from '@nestjs/common';
import { User } from './entities/user.entity';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UserRepository } from './user.repository';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { UpdateUserDto } from './dto/update-user.dto';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ValidationException } from 'src/exceptions/validation.exception';

@Loggable()
@Injectable()
export class UserService {
	constructor(
		private readonly bcryptService: BcryptService,
		private readonly userRepository: UserRepository,
		private readonly cloudinaryService: CloudinaryService,
	) {}

	public async create(createUserDto: CreateUserDto, file: Express.Multer.File): Promise<User> {
		const emailExits = await this.userRepository.findOnByEmail(createUserDto.email);

		if (emailExits) {
			throw new ValidationException({
				email: [MessageConstant.EMAIL_EXISTS],
			});
		}

		const password = createUserDto.password;
		createUserDto.password = await this.bcryptService.hashPassword(password);

		const uploadFile = await this.cloudinaryService.uploadFile(file);
		createUserDto.image = uploadFile?.public_id;

		const user = await this.userRepository.create(createUserDto);

		user.image = uploadFile?.url;
		return user;
	}

	public async update(
		id: number,
		updateUserDto: UpdateUserDto,
		file: Express.Multer.File,
	): Promise<User> {
		if (updateUserDto.email) {
			const emailExits = await this.userRepository.findOnByEmailAndNotId(
				id,
				updateUserDto.email,
			);

			if (emailExits) {
				throw new ValidationException({
					email: [MessageConstant.EMAIL_EXISTS],
				});
			}
		}
		const user = await this.userRepository.findOneById(id);

		if (!user) {
			throw new NotFoundException(MessageConstant.USER_NOT_FOUND);
		}

		delete updateUserDto.password;

		if (file) {
			if (user.image) {
				void this.cloudinaryService.delete(user.image);
			}
			const upload = await this.cloudinaryService.uploadFile(file);
			updateUserDto.image = upload?.public_id;
		}

		const updateUser = await this.userRepository.update(user, updateUserDto);

		if (updateUser.image) {
			updateUser.image = this.cloudinaryService.getFileUrl(updateUser.image);
		}

		return updateUser;
	}

	public async findById(id: number): Promise<User> {
		const user = await this.userRepository.findOneById(id);

		if (!user) {
			throw new NotFoundException(MessageConstant.USER_NOT_FOUND);
		}

		if (user.image) {
			user.image = this.cloudinaryService.getFileUrl(user.image);
		}

		return user;
	}
}
