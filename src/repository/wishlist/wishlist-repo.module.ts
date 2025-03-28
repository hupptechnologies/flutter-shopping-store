import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { WishListRepository } from './wishlist.repository';
import { Wishlist } from '../../module/wishlist/entities/wishlist.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Wishlist])],
	providers: [WishListRepository],
	exports: [WishListRepository],
})
export class WishlistRepoModule {}
