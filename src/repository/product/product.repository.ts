import { Injectable } from '@nestjs/common';
import { Product } from '../../module/product/entities/product.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from '../../module/product/dto/create-product.dto';
import { UpdateProductDto } from '../../module/product/dto/update-product.dto';
import { BaseRepository } from '../base.respository';
import { QueryOptionsDto } from '../../common/dto/query-options.dto';
import { FindAllRes } from '../../common/interface/typeorm.interface';
import { RelationKeys } from '../../common/types/relations.type';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Injectable()
@Loggable()
export class ProductRepository extends BaseRepository {
	private readonly name: string = Product.name.toLowerCase();

	constructor(
		@InjectRepository(Product)
		private readonly repository: Repository<Product>,
	) {
		super();
	}

	async create(createProductDto: CreateProductDto): Promise<Product> {
		const category = this.repository.create(createProductDto);
		return this.repository.save(category);
	}

	async update(product: Product, updateProductDto: UpdateProductDto): Promise<Product> {
		Object.assign(product, updateProductDto);
		return this.repository.save(product);
	}

	async findById(id: number, relations?: RelationKeys<Product>): Promise<Product | null> {
		return await this.repository.findOne({
			where: {
				id,
			},
			relations,
		});
	}

	async findAll(
		dto: QueryOptionsDto,
		relations?: RelationKeys<Product>,
	): Promise<FindAllRes<Product>> {
		const query = this.repository.createQueryBuilder(this.name);

		if (dto.categoryId) {
			query.andWhere(`${query.alias}.categoryId = ${dto.categoryId}`);
		}

		query.likeQuery(['name', 'description'], dto.search);
		query.leftJoins(relations);

		query.orderBy(`${query.alias}.${dto.column}`, dto.orderBy);
		query.skip(dto.skip);
		query.take(dto.perPage);

		const result = await query.getManyAndCount();
		return {
			items: result[0],
			total: result[1],
		};
	}

	async featuredProducts(
		dto: QueryOptionsDto,
		relations?: RelationKeys<Product>,
	): Promise<FindAllRes<Product>> {
		const query = this.repository.createQueryBuilder(this.name);
		if (dto.type) {
			query.andWhere(`${query.alias}.type = :type`, {
				type: dto.type,
			});
		}

		query.leftJoins(relations);

		query.skip(dto.skip);
		query.take(dto.perPage);
		query.orderBy(`${query.alias}.createdAt`, 'DESC');

		const result = await query.getManyAndCount();

		return {
			items: result[0],
			total: result[1],
		};
	}

	async recommendedProducts(
		dto: QueryOptionsDto,
		relations?: RelationKeys<Product>,
	): Promise<FindAllRes<Product>> {
		const query = this.repository.createQueryBuilder(this.name);
		if (dto.type) {
			query.andWhere(`${query.alias}.type = :type`, {
				type: dto.type,
			});
		}

		query.leftJoins(relations);
		query.skip(dto.skip);
		query.take(dto.perPage);
		query.orderBy('RAND()');

		const result = await query.getManyAndCount();

		return {
			items: result[0],
			total: result[1],
		};
	}

	async topCollections(
		dto: QueryOptionsDto,
		relations: RelationKeys<Product> = [],
	): Promise<FindAllRes<Product>> {
		const query = this.repository.createQueryBuilder(this.name);
		if (dto.type) {
			query.andWhere(`${query.alias}.type = :type`, {
				type: dto.type,
			});
		}

		query.leftJoins(relations);

		query.skip(dto.skip);
		query.take(dto.perPage);

		const result = await query.getManyAndCount();

		return {
			items: result[0],
			total: result[1],
		};
	}
}
