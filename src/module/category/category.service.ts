import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Category } from './entities/category.entity';
import { CategoryRepository } from '../../repository/category/category.repository';
import { CreateCategoryDto } from './dto/create-category.dto';
import { MessageConstant } from 'src/common/constant/message.constant';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { CommonUtils } from 'src/common/utils/common.utils';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';
import { PaginationRes } from 'src/common/interface/pagination-res.interface';
import { ImageService } from '../image/image.service';

@Loggable()
@Injectable()
export class CategoryService {
	constructor(
		private readonly categoryRepository: CategoryRepository,
		private readonly imageService: ImageService,
	) {}

	private async getParentCategory(parentId?: number): Promise<Category | undefined> {
		if (!parentId) return undefined;

		const parentCategory = await this.categoryRepository.findOne(parentId);
		if (!parentCategory) {
			throw new NotFoundException(MessageConstant.PARENT_CATEGORY_NOT_FOUND);
		}
		return parentCategory;
	}

	async create(
		createCategoryDto: CreateCategoryDto,
		files: Array<Express.Multer.File>,
	): Promise<Category> {
		createCategoryDto.parent = await this.getParentCategory(createCategoryDto.parentId);

		const category = await this.categoryRepository.create(createCategoryDto);

		await this.imageService.uploadAndAttachImages(files, category);
		return CommonUtils.removeKey(category, 'parent');
	}

	async update(
		id: number,
		updateCategoryDto: UpdateCategoryDto,
		files: Array<Express.Multer.File>,
	): Promise<Category> {
		const category = await this.categoryRepository.findOne(id);

		if (!category) {
			throw new NotFoundException(MessageConstant.CATEGORY_NOT_FOUND);
		}

		updateCategoryDto.parent = await this.getParentCategory(updateCategoryDto.parentId);
		const updateCategory = await this.categoryRepository.update(category, updateCategoryDto);

		await this.imageService.uploadAndAttachImages(files, updateCategory);
		return CommonUtils.removeKey(updateCategory, 'parent');
	}

	async findById(id: number): Promise<Category> {
		const category = await this.categoryRepository.findOne(id);

		if (!category) {
			throw new NotFoundException(MessageConstant.CATEGORY_NOT_FOUND);
		}

		const childrenTree = await this.categoryRepository.findOneWithChildrenTree(category, {
			depth: 2,
			relations: ['images'],
		});
		return childrenTree;
	}

	async delete(id: number): Promise<boolean> {
		const category = await this.categoryRepository.findOne(id);

		if (!category) {
			throw new NotFoundException(MessageConstant.CATEGORY_NOT_FOUND);
		}

		const childrenTree = await this.categoryRepository.findOneWithChildrenTree(category, {
			relations: ['images'],
		});
		const isDeleted = await this.categoryRepository.delete(childrenTree);

		return isDeleted;
	}

	async findAll(queryOptionsDto: QueryOptionsDto): Promise<PaginationRes<Category>> {
		const { items, total } = await this.categoryRepository.findAll(queryOptionsDto, ['images']);
		queryOptionsDto.setTotal(total);
		return {
			items,
			meta: queryOptionsDto,
		};
	}
}
