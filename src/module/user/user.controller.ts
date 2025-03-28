import {
	Body,
	Controller,
	Delete,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
	UploadedFile,
	UseInterceptors,
} from '@nestjs/common';
import { UserService } from './user.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { APIResponse } from '../../common/types/api-response.type';
import { AuthUserId } from '../../decorator/auth-user-id/auth-user-id.decorator';
import { Public } from '../../decorator/public/public.decorator';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';

@Controller(URLConstant.USER)
export class UserController {
	constructor(private readonly userService: UserService) {}

	@Public()
	@Post()
	@UseInterceptors(FileInterceptor(KeyConstant.IMAGE))
	async create(
		@Body() createUserDto: CreateUserDto,
		@UploadedFile() file: Express.Multer.File,
	): APIResponse<User> {
		const createUser = await this.userService.create(createUserDto, file);
		return {
			data: createUser,
			message: MessageConstant.USER_CREATED_SUCCESS,
		};
	}

	@Get([URLConstant.GET_PROFILE, URLConstant.ROUTER_ID])
	async getProfile(
		@AuthUserId() authId: number,
		@Param(KeyConstant.ID) id?: string,
	): APIResponse<User> {
		const user = await this.userService.findById(authId, id);
		return {
			data: user,
			message: MessageConstant.USER_FOUND_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	@UseInterceptors(FileInterceptor(KeyConstant.IMAGE))
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateUserDto: UpdateUserDto,
		@UploadedFile() file: Express.Multer.File,
	): APIResponse<User> {
		const updateUser = await this.userService.update(id, updateUserDto, file);
		return {
			data: updateUser,
			message: MessageConstant.USER_UPDATE_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<boolean> {
		const isDeleted = await this.userService.delete(id);
		return {
			data: isDeleted,
			message: MessageConstant.USER_DELETED_SUCCESS,
		};
	}
}
