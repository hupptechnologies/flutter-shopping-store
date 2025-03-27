import { Controller } from '@nestjs/common';
import { CartService } from './cart.service';
import { URLConstant } from 'src/common/constant/url.constant';

@Controller(URLConstant.CART)
export class CartController {
	constructor(private readonly cartService: CartService) {}
}
