import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Variant } from './entities/variant.entity';
import { Repository } from 'typeorm';
import { CreateVariantDto } from './dto/create-variant.dto';

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
}
