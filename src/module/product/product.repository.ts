import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Product } from './entities/product.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { RelationKeys } from 'src/common/types/relations.type';

@Injectable()
@Loggable()
export class ProductRepository {
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
}
