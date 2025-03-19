import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CategoryRepository } from 'src/repository/category/category.repository';
import { Category } from 'src/module/category/entities/category.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Category])],
	providers: [CategoryRepository],
	exports: [CategoryRepository],
})
export class CategoryRepoModule {}
