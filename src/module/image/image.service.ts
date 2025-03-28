import { Injectable } from '@nestjs/common';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { ImageRepository } from '../../repository/image/image.repository';
import { CloudinaryService } from '../../services/cloudinary/cloudinary.service';
import { Category } from '../category/entities/category.entity';
import { Product } from '../product/entities/product.entity';
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
