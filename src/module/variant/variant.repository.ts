import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Variant } from './entities/variant.entity';
import { Repository } from 'typeorm';
import { CreateVariantDto } from './dto/create-variant.dto';
import { UpdateVariantDto } from './dto/update-variant.dto';

@Injectable()
@Loggable()
export class VariantRepository {
	constructor(
		@InjectRepository(Variant)
		private readonly repository: Repository<Variant>,
	) {}

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
}
