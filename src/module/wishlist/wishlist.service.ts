import { Injectable } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { BrandsWishlist } from '../../common/interface/wishlist.interface';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { ProductRepository } from '../../repository/product/product.repository';
import { WishListRepository } from '../../repository/wishlist/wishlist.repository';
import { User } from '../user/entities/user.entity';
import { Wishlist } from './entities/wishlist.entity';

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

	public async findAll(userId: number): Promise<Array<Wishlist>> {
		return this.repository.findAllByUserId(userId, ['product']);
	}

	public async findAllWithBrands(userId: number): Promise<Array<BrandsWishlist>> {
		return this.repository.findWishlistGroupedByCategory(userId);
	}
}
