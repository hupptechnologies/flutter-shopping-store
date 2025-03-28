import { Body, Controller, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { CartService } from './cart.service';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { CartList } from '../../common/interface/cart-list.interface';
import { APIResponse } from '../../common/types/api-response.type';
import { AuthUserId } from '../../decorator/auth-user-id/auth-user-id.decorator';
import { AuthUser } from '../../decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { CreateCartDto } from './dto/create-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';
import { Cart } from './entities/cart.entity';

@Controller(URLConstant.CART)
export class CartController {
	constructor(private readonly cartService: CartService) {}

	@Post()
	async create(@Body() createCartDto: CreateCartDto, @AuthUser() user: User): APIResponse<Cart> {
		const cart = await this.cartService.create(createCartDto, user);
		return {
			data: cart,
			message: MessageConstant.ITEM_ADDED_TO_CART_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateCartDto: UpdateCartDto,
		@AuthUserId() userId: number,
	): APIResponse<CartList> {
		const carts = await this.cartService.update(id, updateCartDto, userId);
		return {
			data: carts,
			message: MessageConstant.CART_UPDATED_SUCCESS,
		};
	}

	@Get()
	async findAll(@AuthUserId() userId: number): APIResponse<CartList> {
		const carts = await this.cartService.findAll(userId);
		return {
			data: carts,
			message: MessageConstant.CART_CALCULATED_SUCCESS,
		};
	}
}
