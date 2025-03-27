import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Variant } from '../../module/variant/entities/variant.entity';
import { Repository } from 'typeorm';
import { CreateVariantDto } from '../../module/variant/dto/create-variant.dto';
import { UpdateVariantDto } from '../../module/variant/dto/update-variant.dto';
import { BaseRepository } from '../base.respository';

@Injectable()
@Loggable()
export class VariantRepository extends BaseRepository {
	constructor(
		@InjectRepository(Variant)
		private readonly repository: Repository<Variant>,
	) {
		super();
	}

	async craete(createVariantDto: CreateVariantDto): Promise<Variant> {
		const response = this.repository.create(createVariantDto);
		return this.repository.save(response);
	}

	async findOne(id: number): Promise<Variant | null> {
		return this.repository.findOne({
			where: {
				id,
			},
		});
	}

	async update(variant: Variant, dto: UpdateVariantDto): Promise<Variant> {
		Object.assign(variant, dto);
		return this.repository.save(variant);
	}

	async findAll(productId: number): Promise<Array<Variant>> {
		const products = await this.repository.findBy({
			product: {
				id: productId,
			},
		});
		return products;
	}
}
