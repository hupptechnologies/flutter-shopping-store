import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CreateProdctDto } from './dto/create-prodcut.dto';
import { ProductRepository } from './product.repository';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { CategoryRepository } from '../category/category.repository';
import { Product } from './entities/product.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ImageRepository } from '../image/image.repository';

@Injectable()
@Loggable()
export class ProductService {
	constructor(
		private readonly productRepository: ProductRepository,
		private readonly cloudinaryService: CloudinaryService,
		private readonly categoryRepository: CategoryRepository,
		private readonly imageRepository: ImageRepository,
	) {}

	private async uploadAndAttachImages(
		files: Array<Express.Multer.File>,
		product: Product,
	): Promise<void> {
		if (!files || files.length === 0) return;

		const images = await this.cloudinaryService.uploadMultipleFiles(files);
		const createBulkImage = await this.imageRepository.createBulk({
			images,
			product,
		});
		product.images ??= [];
		product.images.push(...createBulkImage);
	}

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

		await this.uploadAndAttachImages(files, product);
		return product;
	}
}
