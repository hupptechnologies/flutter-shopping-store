import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CreateProdctDto } from './dto/create-prodcut.dto';
import { ProductRepository } from './product.repository';
import { CategoryRepository } from '../category/category.repository';
import { Product } from './entities/product.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ImageService } from '../image/image.service';

@Injectable()
@Loggable()
export class ProductService {
	constructor(
		private readonly productRepository: ProductRepository,
		private readonly categoryRepository: CategoryRepository,
		private readonly imageService: ImageService,
	) {}

	public async create(
		createProdctDto: CreateProdctDto,
		files: Array<Express.Multer.File>,
	): Promise<Product> {
		const category = await this.categoryRepository.findOne(createProdctDto.categoryId);

		if (!category) {
			throw new NotFoundException(MessageConstant.CATEGORY_NOT_FOUND);
		}

		createProdctDto.category = category;

		const product = await this.productRepository.create(createProdctDto);

		await this.imageService.uploadAndAttachImages(files, product);
		return product;
	}
}
