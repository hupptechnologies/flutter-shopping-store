import {
	Body,
	Controller,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
	UploadedFile,
	UseInterceptors,
} from '@nestjs/common';
import { UserService } from './user.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { ApiResponse } from 'src/common/interface/api-reponse.interface';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { MessageConstant } from 'src/common/constant/message.constant';
import { FileInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { UpdateUserDto } from './dto/update-user.dto';
import { Public } from 'src/decorator/public/public.decorator';

@Controller(URLConstant.USER)
export class UserController {
	constructor(private readonly userService: UserService) {}

	@Public()
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

	@Patch(URLConstant.ROUTER_ID)
	@UseInterceptors(FileInterceptor(KeyConstant.IMAGE))
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateUserDto: UpdateUserDto,
		@UploadedFile() file: Express.Multer.File,
	): Promise<ApiResponse<User>> {
		const updateUser = await this.userService.update(id, updateUserDto, file);
		return {
			data: updateUser,
			message: MessageConstant.USER_UPDATE_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	async findById(@Param(KeyConstant.ID, ParseIntPipe) id: number): Promise<ApiResponse<User>> {
		const user = await this.userService.findById(id);
		return {
			data: user,
			message: MessageConstant.USER_FOUND_SUCCESS,
		};
	}
}
