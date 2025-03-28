import { Injectable } from '@nestjs/common';
import { BaseRepository } from '../base.respository';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { RelationKeys } from '../../common/types/relations.type';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { CreateCartDto } from '../../module/cart/dto/create-cart.dto';
import { Cart } from '../../module/cart/entities/cart.entity';
import { User } from '../../module/user/entities/user.entity';

@Loggable()
@Injectable()
export class CartRepository extends BaseRepository {
	constructor(
		@InjectRepository(Cart)
		private readonly repository: Repository<Cart>,
	) {
		super();
	}

	public async findByIdAndUserId(
		id: number,
		userId: number,
		relations?: RelationKeys<Cart>,
	): Promise<Cart | null> {
		return this.repository.findOne({
			where: {
				id,
				user: {
					id: userId,
				},
			},
			relations,
		});
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

	public async update(cart: Cart, newQuantity?: number): Promise<Cart> {
		if (newQuantity) {
			cart.quantity = newQuantity;
		}
		return this.repository.save(cart);
	}

	public async create(createCartDto: CreateCartDto, user: User): Promise<Cart> {
		const cart = this.repository.create(createCartDto);
		cart.user = user;
		return this.repository.save(cart);
	}

	public async updateQuantity(cart: Cart, newQuantity: number): Promise<boolean> {
		if (newQuantity <= 0) {
			return this.delete(cart);
		}
		const update = await this.update(cart, newQuantity);
		return !!update;
	}

	public async fetchAllByUserId(
		userId: number,
		relations?: RelationKeys<Cart>,
	): Promise<Array<Cart>> {
		return this.repository.find({
			where: {
				user: {
					id: userId,
				},
			},
			relations,
		});
	}
}
