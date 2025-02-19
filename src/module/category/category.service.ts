import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Category } from './entities/category.entity';
import { CategoryRepository } from './category.repository';
import { CreateCategoryDto } from './dto/create-category.dto';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { ImageRepository } from '../image/image.repository';
import { MessageConstant } from 'src/common/constant/message.constant';

@Loggable()
@Injectable()
export class CategoryService {
	constructor(
		private readonly categoryRepository: CategoryRepository,
		private readonly cloudinaryService: CloudinaryService,
		private readonly imageRepository: ImageRepository,
	) {}

	async create(
		createCategoryDto: CreateCategoryDto,
		files: Array<Express.Multer.File>,
	): Promise<Category> {
		const uploadFiles = this.cloudinaryService.uploadMultipleFiles(files);

		if (createCategoryDto.parentId) {
			const parentCategory = await this.categoryRepository.findOne(
				createCategoryDto.parentId,
			);

			if (!parentCategory) {
				throw new NotFoundException(MessageConstant.PARENT_CATEGORY_NOT_FOUND);
			}
			createCategoryDto.parent = parentCategory;
		}

		const category = await this.categoryRepository.create(createCategoryDto);

		const images = await uploadFiles;
		const createBulkImage = await this.imageRepository.createBulk({
			images,
			category,
		});
		category.images = createBulkImage;
		delete category.parent;

		return category;
	}
}
