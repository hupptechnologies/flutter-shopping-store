import { Module } from '@nestjs/common';
import { CartService } from './cart.service';
import { CartController } from './cart.controller';
import { CartRepoModule } from 'src/repository/cart/cart-repo.module';

@Module({
	imports: [CartRepoModule],
	controllers: [CartController],
	providers: [CartService],
})
export class CartModule {}
