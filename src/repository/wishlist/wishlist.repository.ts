import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Wishlist } from 'src/module/wishlist/entities/wishlist.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { User } from 'src/module/user/entities/user.entity';

@Loggable()
@Injectable()
export class WishListRepository {
	constructor(
		@InjectRepository(Wishlist)
		private readonly repository: Repository<Wishlist>,
	) {}

	public async findById(
		productId: number,
		userId: number,
		withDeleted = false,
	): Promise<Wishlist | null> {
		return this.repository.findOne({
			where: {
				product: {
					id: productId,
				},
				user: {
					id: userId,
				},
			},
			withDeleted,
		});
	}

	public async create(product: Product, user: User): Promise<Wishlist> {
		const wishlist = this.repository.create({
			product,
			user,
		});
		return this.repository.save(wishlist);
	}

	public async delete(wishlist: Wishlist, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const deleteWishlist = await wishlist.softRemove();
			return !!deleteWishlist;
		}
		const deleteWishlist = await wishlist.remove();
		return !!deleteWishlist;
	}
}
