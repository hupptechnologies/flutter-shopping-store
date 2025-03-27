import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseConfig } from './config/database.config';
import { UserModule } from './module/user/user.module';
import { AuthModule } from './module/auth/auth.module';
import { AddressModule } from './module/address/address.module';
import { CategoryModule } from './module/category/category.module';
import { ProductModule } from './module/product/product.module';
import { VoucherModule } from './module/voucher/voucher.module';
import { CardsModule } from './module/cards/cards.module';
import { CryptoService } from './services/crypto/crypto.service';
import { AppConfigModule } from './config/app/app-config.module';
import { ReviewModule } from './module/review/review.module';
import { VariantModule } from './module/variant/variant.module';
import { WishlistModule } from './module/wishlist/wishlist.module';
import { CartModule } from './module/cart/cart.module';

@Module({
	imports: [
		AppConfigModule,
		TypeOrmModule.forRootAsync({
			imports: [AppConfigModule],
			useClass: DatabaseConfig,
		}),
		AuthModule,
		UserModule,
		AddressModule,
		CategoryModule,
		ProductModule,
		VoucherModule,
		CardsModule,
		ReviewModule,
		VariantModule,
		WishlistModule,
		CartModule,
	],
	controllers: [AppController],
	providers: [AppService, CryptoService],
})
export class AppModule {}
