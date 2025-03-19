import { Module } from '@nestjs/common';
import { WishlistService } from './wishlist.service';
import { WishlistController } from './wishlist.controller';
import { WishlistRepoModule } from 'src/repository/wishlist/wishlist-repo.module';

@Module({
	imports: [WishlistRepoModule],
	controllers: [WishlistController],
	providers: [WishlistService],
})
export class WishlistModule {}
