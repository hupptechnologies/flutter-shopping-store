import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Category } from '../../module/category/entities/category.entity';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from '../../module/category/dto/create-category.dto';
import { RelationKeys } from 'src/common/types/relations.type';
import { UpdateCategoryDto } from '../../module/category/dto/update-category.dto';
import { FindAllRes, FindTreeOptions } from 'src/common/interface/typeorm.interface';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';

@Loggable()
@Injectable()
export class CategoryRepository {
	private readonly name: string = Category.name.toLowerCase();

	constructor(
		@InjectRepository(Category)
		private readonly repository: Repository<Category>,
	) {}

	async create(createCategoryDto: CreateCategoryDto): Promise<Category> {
		const category = this.repository.create(createCategoryDto);
		return this.repository.save(category);
	}

	async update(category: Category, updateCategoryDto: UpdateCategoryDto): Promise<Category> {
		Object.assign(category, updateCategoryDto);
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

	async findOneWithChildrenTree(
		category: Category,
		options?: FindTreeOptions<Category>,
	): Promise<Category> {
		return this.repository.manager
			.getTreeRepository(Category)
			.findDescendantsTree(category, options);
	}

	async delete(category: Category, isSoftDelete = true): Promise<boolean> {
		if (isSoftDelete) {
			const deleteRecord = await this.repository.softRemove(category);
			return !!deleteRecord;
		}
		const deleteRecord = await this.repository.remove(category);
		return !!deleteRecord;
	}

	async findAll(
		queryOptionsDto: QueryOptionsDto,
		relations?: RelationKeys<Category>,
	): Promise<FindAllRes<Category>> {
		const query = this.repository.createQueryBuilder(this.name);

		if (queryOptionsDto.depth) {
			let parentAlias = this.name;
			for (let i = 1; i <= queryOptionsDto.depth; i++) {
				const childAlias = `child${i}`;
				query.leftJoinAndSelect(`${parentAlias}.children`, childAlias);
				parentAlias = childAlias;
			}
		}

		query.andWhere(`${this.name}.parent IS NULL`);

		if (queryOptionsDto.search) {
			query.likeQuery(['name', 'description'], queryOptionsDto.search);
		}

		if (queryOptionsDto.gender) {
			query.andWhere(`${this.name}.gender = :gender`, {
				gender: queryOptionsDto.gender,
			});
		}

		query.leftJoins(relations);

		query.orderBy(`${query.alias}.${queryOptionsDto.column}`, queryOptionsDto.orderBy);
		query.skip(queryOptionsDto.skip);
		query.take(queryOptionsDto.perPage);

		const result = await query.getManyAndCount();
		return {
			items: result[0],
			total: result[1],
		};
	}
}
