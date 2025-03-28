import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Product } from '../../module/product/entities/product.entity';
import { ProductRepository } from './product.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Product])],
	providers: [ProductRepository],
	exports: [ProductRepository],
})
export class ProductRepoModule {}
