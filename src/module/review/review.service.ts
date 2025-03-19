import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { ReviewRepository } from '../../repository/review/review.repository';
import { CreateReviewDto } from './dto/create-review.dto';
import { User } from '../user/entities/user.entity';
import { Review } from './entities/review.entity';
import { ProductRepository } from '../../repository/product/product.repository';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ImageService } from '../image/image.service';
import { CommonUtils } from 'src/common/utils/common.utils';

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
