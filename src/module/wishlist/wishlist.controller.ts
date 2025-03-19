import { Controller, Get, Param, ParseIntPipe, Patch } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { KeyConstant } from 'src/common/constant/key.constant';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { APIResponse } from 'src/common/types/api-response.type';
import { AuthUserId } from 'src/decorator/auth-user-id/auth-user-id.decorator';
import { MessageConstant } from 'src/common/constant/message.constant';
import { Wishlist } from './entities/wishlist.entity';
import { BrandsWishlist } from 'src/common/interface/wishlist.interface';

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
