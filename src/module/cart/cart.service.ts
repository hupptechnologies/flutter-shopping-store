import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CartRepository } from 'src/repository/cart/cart.repository';
import { User } from '../user/entities/user.entity';
import { CreateCartDto } from './dto/create-cart.dto';
import { ProductRepository } from 'src/repository/product/product.repository';
import { VariantRepository } from 'src/repository/variant/variant.repository';
import { MessageConstant } from 'src/common/constant/message.constant';
import { QuantityUtils } from 'src/common/utils/quantity.utils';
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
}
