import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { Image } from '../../module/image/entities/image.entity';
import { CreateBulkImage } from '../../common/interface/image.interface';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class ImageRepository {
	constructor(
		@InjectRepository(Image)
		private readonly repository: Repository<Image>,
	) {}

	async createBulk(createBulkImage: CreateBulkImage): Promise<Array<Image>> {
		const { images, category, product, review, variant } = createBulkImage;
		const createImages = images.map((image) => {
			return {
				url: image.url,
				public_id: image.public_id,
				category,
				product,
				review,
				variant,
			};
		});
		const image = this.repository.create(createImages);
		return this.repository.save(image);
	}
}
