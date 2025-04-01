import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BaseRepository } from '../base.respository';
import { BrandsWishlist } from '../../common/interface/wishlist.interface';
import { RelationKeys } from '../../common/types/relations.type';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { Product } from '../../module/product/entities/product.entity';
import { User } from '../../module/user/entities/user.entity';
import { Wishlist } from '../../module/wishlist/entities/wishlist.entity';

@Loggable()
@Injectable()
export class WishListRepository extends BaseRepository {
	constructor(
		@InjectRepository(Wishlist)
		private readonly repository: Repository<Wishlist>,
	) {
		super();
	}

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

	public async findAllByUserId(
		userId: number,
		relations?: RelationKeys<Wishlist>,
	): Promise<Array<Wishlist>> {
		return this.repository.find({
			where: {
				user: {
					id: userId,
				},
			},
			relations,
		});
	}

	public async findWishlistGroupedByCategory(userId: number): Promise<Array<BrandsWishlist>> {
		const selectData = this.getWishlistSelection();
		const query = this.repository
			.createQueryBuilder('wishlist')
			.innerJoin('wishlist.product', 'product')
			.innerJoin('product.category', 'category')
			.leftJoin(
				(qb) =>
					qb
						.from('image', 'image')
						.select([
							'image.productId AS productId',
							`JSON_ARRAYAGG(
								JSON_OBJECT(
									"id", image.id,
									"url", image.url
								)
							) AS images`,
						])
						.where('image.deletedAt IS NULL')
						.groupBy('image.productId'),
				'images',
				'images.productId = product.id',
			)
			.select(selectData)
			.where('wishlist.userId = :userId', {
				userId,
			})
			.groupBy('category.id');

		return query.getRawMany<BrandsWishlist>();
	}

	private getWishlistSelection(): Array<string> {
		return [
			`JSON_OBJECT(
				"id", category.id,
				"name", category.name
			) AS category`,

			`JSON_ARRAYAGG(
				JSON_OBJECT(
					"id", product.id,
					"name", product.name,
					"price", product.price,
					"images", IFNULL(images.images, JSON_ARRAY())
				)
			) AS products`,
		];
	}
}
