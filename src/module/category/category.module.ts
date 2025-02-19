import { Module } from '@nestjs/common';
import { CategoryService } from './category.service';
import { CategoryController } from './category.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { CategoryRepository } from './category.repository';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { ImageModule } from '../image/image.module';

@Module({
	imports: [TypeOrmModule.forFeature([Category]), ImageModule],
	controllers: [CategoryController],
	providers: [CategoryService, CategoryRepository, CloudinaryService],
})
export class CategoryModule {}
