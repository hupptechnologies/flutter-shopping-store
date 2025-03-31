import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Variant } from '../../module/variant/entities/variant.entity';
import { FindOptionsWhere, Not, Repository } from 'typeorm';
import { CreateVariantDto } from '../../module/variant/dto/create-variant.dto';
import { UpdateVariantDto } from '../../module/variant/dto/update-variant.dto';
import { BaseRepository } from '../base.respository';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { MessageConstant } from '../../common/constant/message.constant';
import { RelationKeys } from '../../common/types/relations.type';

@Injectable()
@Loggable()
export class VariantRepository extends BaseRepository {
	constructor(
		@InjectRepository(Variant)
		private readonly repository: Repository<Variant>,
	) {
		super();
	}

	async existingVariant({
		color,
		productId,
		size,
		id,
	}: {
		productId: number;
		color: string;
		size: string;
		id?: number;
	}): Promise<void> {
		const where: FindOptionsWhere<Variant> = {
			product: {
				id: productId,
			},
			color,
			size,
		};

		if (id) {
			where.id = Not(id);
		}

		const variant = await this.repository.findOne({
			where,
		});

		if (variant) {
			throw new BadRequestException(MessageConstant.VARIANT_EXISTS);
		}
	}

	async craete(createVariantDto: CreateVariantDto): Promise<Variant> {
		const response = this.repository.create(createVariantDto);
		return this.repository.save(response);
	}

	async findOne(id: number, relations?: RelationKeys<Variant>): Promise<Variant | null> {
		return this.repository.findOne({
			where: {
				id,
			},
			relations,
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
