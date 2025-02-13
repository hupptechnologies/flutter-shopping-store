import { Body, Controller, Post, UploadedFile, UseInterceptors } from '@nestjs/common';
import { UserService } from './user.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { MessageConstant } from 'src/common/constant/message.constant';
import { FileInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';

@Controller(URLConstant.USER)
export class UserController {
	constructor(private readonly userService: UserService) {}

	@Post()
	@UseInterceptors(FileInterceptor(KeyConstant.IMAGE))
	async create(
		@Body() createUserDto: CreateUserDto,
		@UploadedFile() file: Express.Multer.File,
	): Promise<ApiResponse<User>> {
		const createUser = await this.userService.create(createUserDto, file);
		return {
			data: createUser,
			message: MessageConstant.USER_CREATED_SUCCESS,
		};
	}
}
