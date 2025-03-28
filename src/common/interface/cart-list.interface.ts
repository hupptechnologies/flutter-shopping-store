import { Cart } from '../../module/cart/entities/cart.entity';

export interface CartList {
	carts: Array<Cart>;
	calculate: {
		productPrice: number;
		shipping: number;
		total: number;
	};
}
