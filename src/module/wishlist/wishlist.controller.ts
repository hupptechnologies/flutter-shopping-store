import { Controller } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { URLConstant } from 'src/common/constant/url.constant';

@Controller(URLConstant.WISHLIST)
export class WishlistController {
	constructor(private readonly wishlistService: WishlistService) {}
}
