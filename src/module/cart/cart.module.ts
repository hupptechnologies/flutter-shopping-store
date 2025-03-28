import { Module } from '@nestjs/common';
import { CartService } from './cart.service';
import { CartController } from './cart.controller';
import { CartRepoModule } from '../../repository/cart/cart-repo.module';
import { ProductRepoModule } from '../../repository/product/product-repo.module';
import { VariantRepoModule } from '../../repository/variant/variant-repo.module';

@Module({
	imports: [CartRepoModule, ProductRepoModule, VariantRepoModule],
	controllers: [CartController],
	providers: [CartService],
})
export class CartModule {}
