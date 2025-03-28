import { Injectable, NotFoundException } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { CommonUtils } from '../../common/utils/common.utils';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { ProductRepository } from '../../repository/product/product.repository';
import { ReviewRepository } from '../../repository/review/review.repository';
import { ImageService } from '../image/image.service';
import { User } from '../user/entities/user.entity';
import { CreateReviewDto } from './dto/create-review.dto';
import { Review } from './entities/review.entity';

@Injectable()
@Loggable()
export class ReviewService {
	constructor(
		private readonly repository: ReviewRepository,
		private readonly productRepository: ProductRepository,
		private readonly imageService: ImageService,
	) {}

	public async create(
		dto: CreateReviewDto,
		user: User,
		files: Array<Express.Multer.File>,
	): Promise<Review> {
		if (dto.productId) {
			const product = await this.productRepository.findById(dto.productId);

			if (!product) {
				throw new NotFoundException(MessageConstant.PRODUCT_NOT_FOUND);
			}

			dto.product = product;
		}
		const review = await this.repository.create(dto, user);

		await this.imageService.uploadAndAttachImages(files, review);

		return CommonUtils.removeKey(review, ['user', 'product']);
	}

	public async delete(id: number, userId: number): Promise<boolean> {
		const review = await this.repository.findByIdAndUserId(id, userId);

		if (!review) {
			throw new NotFoundException(MessageConstant.REVIEW_NOT_FOUND);
		}

		const isDelete = await this.repository.delete(review);
		return isDelete;
	}
}
