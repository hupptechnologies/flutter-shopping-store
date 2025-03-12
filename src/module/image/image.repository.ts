import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Repository } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { Image } from './entities/image.entity';
import { CreateBulkImage } from 'src/common/interface/image.interface';

@Loggable()
@Injectable()
export class ImageRepository {
	constructor(
		@InjectRepository(Image)
		private readonly repository: Repository<Image>,
	) {}

	async createBulk(createBulkImage: CreateBulkImage): Promise<Array<Image>> {
		const { images, category, product, review } = createBulkImage;
		const createImages = images.map((image) => {
			return {
				url: image.url,
				public_id: image.public_id,
				category,
				product,
				review,
			};
		});
		const image = this.repository.create(createImages);
		return this.repository.save(image);
	}
}
