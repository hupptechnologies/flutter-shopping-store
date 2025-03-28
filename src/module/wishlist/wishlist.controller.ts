import { Controller, Get, Param, ParseIntPipe, Patch } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { BrandsWishlist } from '../../common/interface/wishlist.interface';
import { APIResponse } from '../../common/types/api-response.type';
import { AuthUserId } from '../../decorator/auth-user-id/auth-user-id.decorator';
import { AuthUser } from '../../decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { Wishlist } from './entities/wishlist.entity';

@Controller(URLConstant.WISHLIST)
export class WishlistController {
	constructor(private readonly wishlistService: WishlistService) {}

	@Patch(URLConstant.ROUTER_ID)
	async addOrRemove(
		@Param(KeyConstant.ID, ParseIntPipe) productId: number,
		@AuthUser() user: User,
	): APIResponse<boolean> {
		const messag = await this.wishlistService.addOrRemove(productId, user);
		return {
			data: true,
			message: messag,
		};
	}

	@Get()
	async findAll(@AuthUserId() userId: number): APIResponse<Array<Wishlist>> {
		const wishlist = await this.wishlistService.findAll(userId);
		return {
			data: wishlist,
			message: MessageConstant.WISHLIST_FETCHED_SUCCESS,
		};
	}

	@Get(URLConstant.BRANDS)
	async findAllWithBrands(@AuthUserId() userId: number): APIResponse<Array<BrandsWishlist>> {
		const brands = await this.wishlistService.findAllWithBrands(userId);
		return {
			data: brands,
			message: MessageConstant.WISHLIST_FETCHED_SUCCESS,
		};
	}
}
