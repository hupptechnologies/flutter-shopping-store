import { Injectable } from '@nestjs/common';
import { BaseRepository } from '../base.respository';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from 'src/module/cart/entities/cart.entity';
import { Repository } from 'typeorm';
import { CreateCartDto } from 'src/module/cart/dto/create-cart.dto';
import { User } from 'src/module/user/entities/user.entity';

@Loggable()
@Injectable()
export class CartRepository extends BaseRepository {
	constructor(
		@InjectRepository(Cart)
		private readonly repository: Repository<Cart>,
	) {
		super();
	}

	public async findByUserIdProcutIdAndVariantId(
		userId: number,
		productId: number,
		variantId: number,
	): Promise<Cart | null> {
		return this.repository.findOne({
			where: {
				user: {
					id: userId,
				},
				product: {
					id: productId,
				},
				variant: {
					id: variantId,
				},
			},
		});
	}

	public async update(cart: Cart, newQuantity: number): Promise<Cart> {
		cart.quantity = newQuantity;
		return this.repository.save(cart);
	}

	public async create(createCartDto: CreateCartDto, user: User): Promise<Cart> {
		const cart = this.repository.create(createCartDto);
		cart.user = user;
		return this.repository.save(cart);
	}
}
