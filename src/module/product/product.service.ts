import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CreateProductDto } from './dto/create-product.dto';
import { ProductRepository } from '../../repository/product/product.repository';
import { CategoryRepository } from '../../repository/category/category.repository';
import { Product } from './entities/product.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { ImageService } from '../image/image.service';
import { UpdateProductDto } from './dto/update-product.dto';
import { CommonUtils } from 'src/common/utils/common.utils';
import { Category } from '../category/entities/category.entity';
import { PaginationRes } from 'src/common/interface/pagination-res.interface';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';

@Injectable()
@Loggable()
export class ProductService {
	constructor(
		private readonly productRepository: ProductRepository,
		private readonly categoryRepository: CategoryRepository,
		private readonly imageService: ImageService,
	) {}

	private async categoryById(id: number): Promise<Category> {
		const category = await this.categoryRepository.findOne(id);

		if (!category) {
			throw new NotFoundException(MessageConstant.CATEGORY_NOT_FOUND);
		}

		return category;
	}

	public async create(
		createProductDto: CreateProductDto,
		files: Array<Express.Multer.File>,
	): Promise<Product> {
		const category = await this.categoryById(createProductDto.categoryId);
		createProductDto.category = category;

		const product = await this.productRepository.create(createProductDto);

		await this.imageService.uploadAndAttachImages(files, product);
		return CommonUtils.removeKey(product, 'category');
	}

	public async update(
		id: number,
		updateProductDto: UpdateProductDto,
		files: Array<Express.Multer.File>,
	): Promise<Product> {
		const product = await this.productRepository.findById(id);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODCUT_NOT_FOUND);
		}

		if (updateProductDto.categoryId) {
			const category = await this.categoryById(updateProductDto.categoryId);
			updateProductDto.category = category;
		}

		const updateProduct = await this.productRepository.update(product, updateProductDto);

		await this.imageService.uploadAndAttachImages(files, updateProduct);
		return updateProduct;
	}

	public async findOne(id: number): Promise<Product> {
		const product = await this.productRepository.findById(id, ['category', 'reviews']);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODCUT_NOT_FOUND);
		}

		return product;
	}

	public async delete(id: number): Promise<boolean> {
		const product = await this.productRepository.findById(id);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODCUT_NOT_FOUND);
		}

		const isDelete = await this.productRepository.delete(product);
		return isDelete;
	}

	public async findAll(query: QueryOptionsDto): Promise<PaginationRes<Product>> {
		const { items, total } = await this.productRepository.findAll(query, ['images']);
		query.setTotal(total);
		return {
			items,
			meta: query,
		};
	}
}
