import { Body, Controller, Post } from '@nestjs/common';
import { CartService } from './cart.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Cart } from './entities/cart.entity';
import { CreateCartDto } from './dto/create-cart.dto';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { MessageConstant } from 'src/common/constant/message.constant';

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
}
