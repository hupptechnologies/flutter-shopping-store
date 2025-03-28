import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Category } from '../../module/category/entities/category.entity';
import { CategoryRepository } from './category.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Category])],
	providers: [CategoryRepository],
	exports: [CategoryRepository],
})
export class CategoryRepoModule {}
