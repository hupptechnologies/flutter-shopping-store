import { Module } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { WishlistController } from './wishlist.controller';
import { WishlistRepoModule } from 'src/repository/wishlist/wishlist-repo.module';
import { ProductRepoModule } from 'src/repository/product/product-repo.module';

@Module({
	imports: [WishlistRepoModule, ProductRepoModule],
	controllers: [WishlistController],
	providers: [WishlistService],
})
export class WishlistModule {}
