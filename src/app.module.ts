import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
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

@Module({
	imports: [
		ConfigModule.forRoot({
			isGlobal: true,
		}),
		TypeOrmModule.forRootAsync({
			imports: [ConfigModule],
			useClass: DatabaseConfig,
		}),
		AuthModule,
		UserModule,
		AddressModule,
		CategoryModule,
		ProductModule,
		VoucherModule,
		CardsModule,
	],
	controllers: [AppController],
	providers: [AppService, CryptoService],
})
export class AppModule {}
