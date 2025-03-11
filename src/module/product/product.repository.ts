import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Product } from './entities/product.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { RelationKeys } from 'src/common/types/relations.type';
import { FindAllRes } from 'src/common/interface/typeorm.interface';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';

@Injectable()
@Loggable()
export class ProductRepository {
	private readonly name: string = Product.name.toLowerCase();

	constructor(
		@InjectRepository(Product)
		private readonly repository: Repository<Product>,
	) {}

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

	async delete(product: Product, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const deleteProduct = await product.softRemove();
			return !!deleteProduct;
		}
		const deleteProduct = await product.remove();
		return !!deleteProduct;
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
}
