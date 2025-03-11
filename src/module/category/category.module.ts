import { Module } from '@nestjs/common';
import { CategoryService } from './category.service';
import { CategoryController } from './category.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { CategoryRepository } from './category.repository';
import { ImageModule } from '../image/image.module';
import { CloudinaryModule } from 'src/services/cloudinary/cloudinary.module';

@Module({
	imports: [CloudinaryModule, TypeOrmModule.forFeature([Category]), ImageModule],
	controllers: [CategoryController],
	providers: [CategoryService, CategoryRepository],
})
export class CategoryModule {}
