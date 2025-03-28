import { Injectable, NotFoundException } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { CartList } from '../../common/interface/cart-list.interface';
import { QuantityUtils } from '../../common/utils/quantity.utils';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { CartRepository } from '../../repository/cart/cart.repository';
import { ProductRepository } from '../../repository/product/product.repository';
import { VariantRepository } from '../../repository/variant/variant.repository';
import { User } from '../user/entities/user.entity';
import { CreateCartDto } from './dto/create-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';
import { Cart } from './entities/cart.entity';

@Loggable()
@Injectable()
export class CartService {
	constructor(
		private readonly repository: CartRepository,
		private readonly productRepository: ProductRepository,
		private readonly variantRepository: VariantRepository,
	) {}

	public async create(createCartDto: CreateCartDto, user: User): Promise<Cart> {
		const product = await this.productRepository.findById(createCartDto.productId);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODUCT_NOT_FOUND);
		}

		const variant = await this.variantRepository.findOne(createCartDto.variantId);

		if (!variant) {
			throw new NotFoundException(MessageConstant.VARIANT_NOT_FOUND);
		}

		QuantityUtils.validateStock(createCartDto.quantity, variant.quantity);

		const cart = await this.repository.findByUserIdProcutIdAndVariantId(
			user.id,
			product.id,
			variant.id,
		);

		if (cart) {
			const newQuantity = QuantityUtils.calculateNewQuantity(
				cart.quantity,
				createCartDto.quantity,
				variant.quantity,
			);
			return this.repository.update(cart, newQuantity);
		}

		createCartDto.price = variant.price ?? product.price;
		createCartDto.product = product;
		createCartDto.variant = variant;
		return this.repository.create(createCartDto, user);
	}

	public async update(
		id: number,
		updateCartDto: UpdateCartDto,
		userId: number,
	): Promise<CartList> {
		const cart = await this.repository.findByIdAndUserId(id, userId, ['variant']);

		if (!cart) {
			throw new NotFoundException(MessageConstant.CART_FOUND_SUCCESS);
		}

		cart.isSelected = updateCartDto.isSelected ?? cart.isSelected;

		if (updateCartDto.quantity != null) {
			const newQuantity = QuantityUtils.calculateNewQuantity(
				cart.quantity,
				updateCartDto.quantity,
				cart.variant.quantity,
			);
			await this.repository.updateQuantity(cart, newQuantity);
		} else {
			await this.repository.update(cart);
		}

		return this.findAll(userId);
	}

	private calculateCart(carts: Array<Cart>): CartList {
		let productPrice = 0;

		const updatedCarts = carts.map((cart) => {
			if (cart.isSelected) {
				productPrice += cart.price * cart.quantity;
			}
			return cart;
		});

		const freeShippingThreshold = 300;
		const shipping = productPrice >= freeShippingThreshold ? 0 : 10;
		const total = productPrice + shipping;

		return {
			carts: updatedCarts,
			calculate: {
				productPrice,
				shipping,
				total,
			},
		};
	}

	public async findAll(userId: number): Promise<CartList> {
		const carts = await this.repository.fetchAllByUserId(userId);
		return this.calculateCart(carts);
	}
}
