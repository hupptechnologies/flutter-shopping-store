import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { ImageRepository } from './image.repository';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { Product } from '../product/entities/product.entity';
import { Category } from '../category/entities/category.entity';
import { Review } from '../review/entities/review.entity';
import { Variant } from '../variant/entities/variant.entity';

@Injectable()
@Loggable()
export class ImageService {
	constructor(
		private readonly imageRespository: ImageRepository,
		private readonly cloudinaryService: CloudinaryService,
	) {}

	public async uploadAndAttachImages<T extends Product | Category | Review | Variant>(
		files: Array<Express.Multer.File>,
		entity: T,
	): Promise<void> {
		if (!files?.length) return;
		const images = await this.cloudinaryService.uploadMultipleFiles(files);
		const keyEntity = entity.constructor.name.toLowerCase();
		const createdImages = await this.imageRespository.createBulk({
			images,
			[keyEntity]: entity,
		});

		entity.images ??= [];
		entity.images.push(...createdImages);
	}
}
