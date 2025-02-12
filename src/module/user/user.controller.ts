import { Body, Controller, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { MessageConstant } from 'src/common/constant/message.constant';

@Controller(URLConstant.USER)
export class UserController {
	constructor(private readonly userService: UserService) {}

	@Post()
	async create(@Body() createUserDto: CreateUserDto): Promise<ApiResponse<User>> {
		const createUser = await this.userService.create(createUserDto);
		return {
			data: createUser,
			message: MessageConstant.USER_CREATED_SUCCESS,
		};
	}
}
