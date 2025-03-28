import { InjectRepository } from '@nestjs/typeorm';
import { Category } from '../../module/category/entities/category.entity';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from '../../module/category/dto/create-category.dto';
import { UpdateCategoryDto } from '../../module/category/dto/update-category.dto';
import { FindAllRes, FindTreeOptions } from '../../common/interface/typeorm.interface';
import { BaseRepository } from '../base.respository';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { RelationKeys } from '../../common/types/relations.type';
import { QueryOptionsDto } from '../../common/dto/query-options.dto';

@Loggable()
@Injectable()
export class CategoryRepository extends BaseRepository {
	private readonly name: string = Category.name.toLowerCase();

	constructor(
		@InjectRepository(Category)
		private readonly repository: Repository<Category>,
	) {
		super();
	}

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

				if (queryOptionsDto.isProductCount) {
					const productAlias = `product${i}`;
					query.leftJoin(`${childAlias}.products`, productAlias);
					query.addSelect([`${productAlias}.id`, `${productAlias}.name`]);
				}
			}
		}

		if (queryOptionsDto.isProductCount) {
			query.leftJoin(`${this.name}.products`, 'product0');
			query.addSelect(['product0.id', 'product0.name']);
		}

		if (queryOptionsDto.gender) {
			query.andWhere(`${this.name}.gender = :gender`, {
				gender: queryOptionsDto.gender,
			});
		} else {
			query.andWhere(`${this.name}.parent IS NULL`);
		}

		if (queryOptionsDto.search) {
			query.likeQuery(['name', 'description'], queryOptionsDto.search);
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
