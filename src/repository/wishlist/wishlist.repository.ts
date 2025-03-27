import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Wishlist } from 'src/module/wishlist/entities/wishlist.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { User } from 'src/module/user/entities/user.entity';
import { RelationKeys } from 'src/common/types/relations.type';
import { BrandsWishlist } from 'src/common/interface/wishlist.interface';
import { BaseRepository } from '../base.respository';

@Loggable()
@Injectable()
export class WishListRepository extends BaseRepository {
	@InjectRepository(Wishlist)
	private readonly repository: Repository<Wishlist>;

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
		return this.repository
			.createQueryBuilder('wishlist')
			.innerJoin('wishlist.product', 'product')
			.innerJoin('product.category', 'category')
			.leftJoin('product.images', 'image')
			.select(selectData)
			.where('wishlist.userId = :userId', {
				userId,
			})
			.groupBy('category.id')
			.getRawMany<BrandsWishlist>();
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
                	    "images", IFNULL(
                	        (SELECT JSON_ARRAYAGG(
                	            JSON_OBJECT(
                	                "id", image.id,
                	                "url", image.url
                	            )
                	        ) FROM image WHERE image.productId = product.id),
                	        JSON_ARRAY()
                	    )
                	)
            	) AS products`,
		];
	}
}
