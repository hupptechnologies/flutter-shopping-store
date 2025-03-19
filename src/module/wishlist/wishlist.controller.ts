import { Controller, Param, ParseIntPipe, Patch } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { KeyConstant } from 'src/common/constant/key.constant';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { APIResponse } from 'src/common/types/api-response.type';

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
}
