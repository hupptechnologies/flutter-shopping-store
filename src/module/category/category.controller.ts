import {
	Body,
	Controller,
	Delete,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
	Query,
	UploadedFiles,
	UseInterceptors,
} from '@nestjs/common';
import { CategoryService } from './category.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { QueryOptionsDto } from '../../common/dto/query-options.dto';
import { PaginationRes } from '../../common/interface/pagination-res.interface';
import { APIResponse } from '../../common/types/api-response.type';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { Category } from './entities/category.entity';

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

	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	@Patch(URLConstant.ROUTER_ID)
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateCategoryDto: UpdateCategoryDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Category> {
		const updateCategory = await this.categoryService.update(id, updateCategoryDto, files);
		return {
			data: updateCategory,
			message: MessageConstant.CATEGORY_UPDATED_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	async findById(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<Category> {
		const category = await this.categoryService.findById(id);
		return {
			data: category,
			message: MessageConstant.CATEGORY_FOUND_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<boolean> {
		const isDeleted = await this.categoryService.delete(id);
		return {
			data: isDeleted,
			message: MessageConstant.CATEGORY_DELETED_SUCCESS,
		};
	}

	@Get()
	async findAll(@Query() queryOptionsDto: QueryOptionsDto): APIResponse<PaginationRes<Category>> {
		const categories = await this.categoryService.findAll(queryOptionsDto);
		return {
			data: categories,
			message: MessageConstant.CATEGORYS_FETCHED_SUCCESS,
		};
	}
}
