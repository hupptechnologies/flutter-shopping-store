import {
	Body,
	Controller,
	Delete,
	Param,
	ParseIntPipe,
	Post,
	UploadedFiles,
	UseInterceptors,
} from '@nestjs/common';
import { ReviewService } from './review.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { CreateReviewDto } from './dto/create-review.dto';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { APIResponse } from 'src/common/types/api-response.type';
import { Review } from './entities/review.entity';
import { User } from '../user/entities/user.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { AuthUserId } from 'src/decorator/auth-user-id/auth-user-id.decorator';

@Controller(URLConstant.REVIEW)
export class ReviewController {
	constructor(private readonly reviewService: ReviewService) {}

	@Post()
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	async create(
		@Body() createReviewDto: CreateReviewDto,
		@AuthUser() user: User,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Review> {
		const review = await this.reviewService.create(createReviewDto, user, files);
		return {
			data: review,
			message: MessageConstant.REVIEW_ADDED_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@AuthUserId() userId: number,
	): APIResponse<boolean> {
		const isDelete = await this.reviewService.delete(id, userId);
		return {
			data: isDelete,
			message: MessageConstant.REVIEW_DELETED_SUCCESS,
		};
	}
}
