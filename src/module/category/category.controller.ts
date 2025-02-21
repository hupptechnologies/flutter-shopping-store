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
import { URLConstant } from 'src/common/constant/url.constant';
import { CreateCategoryDto } from './dto/create-category.dto';
import { APIResponse } from 'src/common/types/api-response.type';
import { Category } from './entities/category.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';
import { PaginationRes } from 'src/common/interface/pagination-res.interface';

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
