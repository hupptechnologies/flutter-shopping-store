import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { ProductRepository } from './product.repository';
import { Product } from './entities/product.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from '../category/entities/category.entity';
import { CategoryRepository } from '../category/category.repository';
import { ImageModule } from '../image/image.module';

@Module({
	imports: [TypeOrmModule.forFeature([Product, Category]), ImageModule],
	controllers: [ProductController],
	providers: [ProductService, ProductRepository, CategoryRepository],
	exports: [ProductRepository],
})
export class ProductModule {}
