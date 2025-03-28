import { Module } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { WishlistController } from './wishlist.controller';
import { WishlistRepoModule } from '../../repository/wishlist/wishlist-repo.module';
import { ProductRepoModule } from '../../repository/product/product-repo.module';

@Module({
	imports: [WishlistRepoModule, ProductRepoModule],
	controllers: [WishlistController],
	providers: [WishlistService],
})
export class WishlistModule {}
