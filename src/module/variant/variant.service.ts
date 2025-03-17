import { Injectable } from '@nestjs/common';
import { ImageService } from 'src/module/image/image.service';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { VariantRepository } from './variant.repository';
import { Variant } from './entities/variant.entity';
import { CreateVariantDto } from './dto/create-variant.dto';
import { MessageConstant } from 'src/common/constant/message.constant';
import { UpdateVariantDto } from './dto/update-variant.dto';

@Injectable()
@Loggable()
export class VariantService {
	constructor(
		private readonly repository: VariantRepository,
		private readonly imageService: ImageService,
	) {}

	public async create(
		createVariantDto: CreateVariantDto,
		files: Array<Express.Multer.File>,
	): Promise<Variant> {
		const create = await this.repository.craete(createVariantDto);
		await this.imageService.uploadAndAttachImages(files, create);
		return create;
	}

	public async findOne(id: number): Promise<Variant> {
		const variant = await this.repository.findOne(id);
		if (!variant) {
			throw new Error(MessageConstant.VARIANT_NOT_FOUND);
		}
		return variant;
	}

	public async update(id: number, updateVariantDto: UpdateVariantDto): Promise<Variant> {
		const variant = await this.repository.findOne(id);

		if (!variant) {
			throw new Error(MessageConstant.VARIANT_NOT_FOUND);
		}

		const updateVariant = await this.repository.update(variant, updateVariantDto);
		return updateVariant;
	}
}
