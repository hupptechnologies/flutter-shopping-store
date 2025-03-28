import { Module } from '@nestjs/common';
import { CategoryService } from './category.service';
import { CategoryController } from './category.controller';
import { ImageModule } from '../image/image.module';
import { CloudinaryModule } from '../../services/cloudinary/cloudinary.module';
import { CategoryRepoModule } from '../../repository/category/category-repo.module';

@Module({
	imports: [CloudinaryModule, CategoryRepoModule, ImageModule],
	controllers: [CategoryController],
	providers: [CategoryService],
})
export class CategoryModule {}
