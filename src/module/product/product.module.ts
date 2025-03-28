import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { ImageModule } from '../image/image.module';
import { CategoryRepoModule } from '../../repository/category/category-repo.module';
import { ProductRepoModule } from '../../repository/product/product-repo.module';

@Module({
	imports: [CategoryRepoModule, ProductRepoModule, ImageModule],
	controllers: [ProductController],
	providers: [ProductService],
})
export class ProductModule {}
