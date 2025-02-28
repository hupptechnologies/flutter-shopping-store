import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Product } from './entities/product.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProdctDto } from './dto/create-prodcut.dto';

@Injectable()
@Loggable()
export class ProductRepository {
	constructor(
		@InjectRepository(Product)
		private readonly repository: Repository<Product>,
	) {}

	async create(createProdctDto: CreateProdctDto): Promise<Product> {
		const category = this.repository.create(createProdctDto);
		return this.repository.save(category);
	}
}
