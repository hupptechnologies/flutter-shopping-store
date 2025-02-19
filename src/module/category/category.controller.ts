import { Body, Controller, Post, UploadedFiles, UseInterceptors } from '@nestjs/common';
import { CategoryService } from './category.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { CreateCategoryDto } from './dto/create-category.dto';
import { APIResponse } from 'src/common/types/api-response.type';
import { Category } from './entities/category.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';

@Controller(URLConstant.CATEGORY)
export class CategoryController {
	constructor(private readonly categoryService: CategoryService) {}

	@Post()
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	async create(
		@Body() createCategoryDto: CreateCategoryDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Category> {
		const category = await this.categoryService.create(createCategoryDto, files);
		return {
			data: category,
			message: MessageConstant.CATEGORY_CREATED_SUCCESS,
		};
	}
}
