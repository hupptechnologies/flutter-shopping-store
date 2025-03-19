import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { User } from '../user/entities/user.entity';
import { WishListRepository } from 'src/repository/wishlist/wishlist.repository';
import { ProductRepository } from 'src/repository/product/product.repository';
import { MessageConstant } from 'src/common/constant/message.constant';

@Injectable()
@Loggable()
export class WishlistService {
	constructor(
		private readonly repository: WishListRepository,
		private readonly productRepository: ProductRepository,
	) {}

	public async addOrRemove(productId: number, user: User): Promise<string> {
		const product = await this.productRepository.findById(productId);

		if (!product) {
			throw new Error(MessageConstant.PRODUCT_NOT_FOUND);
		}

		const wishlist = await this.repository.findById(productId, user.id, true);

		if (wishlist) {
			if (wishlist.deletedAt) {
				await wishlist.recover();
				return MessageConstant.WISHLIST_CREATED_SUCCESS;
			}
			await this.repository.delete(wishlist);
			return MessageConstant.WISHLIST_DELETED_SUCCESS;
		}

		await this.repository.create(product, user);
		return MessageConstant.WISHLIST_CREATED_SUCCESS;
	}
}
