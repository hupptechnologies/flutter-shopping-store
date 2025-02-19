import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Category } from './entities/category.entity';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { RelationKeys } from 'src/common/types/relations.type';

@Loggable()
@Injectable()
export class CategoryRepository {
	constructor(
		@InjectRepository(Category)
		private readonly repository: Repository<Category>,
	) {}

	async create(createCategoryDto: CreateCategoryDto): Promise<Category> {
		const category = this.repository.create(createCategoryDto);
		return this.repository.save(category);
	}

	async findOne(id: number, relations?: RelationKeys<Category>): Promise<Category | null> {
		return this.repository.findOne({
			where: {
				id,
			},
			relations,
		});
	}
}
