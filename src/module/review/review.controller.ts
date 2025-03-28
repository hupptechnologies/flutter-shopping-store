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
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { APIResponse } from '../../common/types/api-response.type';
import { AuthUserId } from '../../decorator/auth-user-id/auth-user-id.decorator';
import { AuthUser } from '../../decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { CreateReviewDto } from './dto/create-review.dto';
import { Review } from './entities/review.entity';

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
