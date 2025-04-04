import { Injectable, NotFoundException } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { QueryOptionsDto } from '../../common/dto/query-options.dto';
import { DashboardList } from '../../common/interface/dashboard-list.interface';
import { PaginationRes } from '../../common/interface/pagination-res.interface';
import { RelationKeys } from '../../common/types/relations.type';
import { CommonUtils } from '../../common/utils/common.utils';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { CategoryRepository } from '../../repository/category/category.repository';
import { ProductRepository } from '../../repository/product/product.repository';
import { Category } from '../category/entities/category.entity';
import { ImageService } from '../image/image.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

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
			throw new NotFoundException(MessageConstant.PRODUCT_NOT_FOUND);
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
		const product = await this.productRepository.findById(id, [
			'category',
			'variants',
			'reviews',
		]);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODUCT_NOT_FOUND);
		}

		return product;
	}

	public async delete(id: number): Promise<boolean> {
		const product = await this.productRepository.findById(id, ['variants', 'reviews']);

		if (!product) {
			throw new NotFoundException(MessageConstant.PRODUCT_NOT_FOUND);
		}

		const isDelete = await this.productRepository.delete(product);
		return isDelete;
	}

	public async findAll(query: QueryOptionsDto, userId: number): Promise<PaginationRes<Product>> {
		const { items, total } = await this.productRepository.findAll(query, userId, ['images']);
		query.setTotal(total);
		return {
			items,
			meta: query,
		};
	}

	public async fetchDashboardData(query: QueryOptionsDto): Promise<DashboardList> {
		const relations: RelationKeys<Product> = ['images'];
		const featuredProducts = await this.productRepository.featuredProducts(query, relations);
		const recommendedProducts = await this.productRepository.recommendedProducts(
			query,
			relations,
		);
		const topCollections = await this.productRepository.topCollections(
			query,
			relations.push('category'),
		);
		return {
			featuredProducts: featuredProducts.items,
			recommendedProducts: recommendedProducts.items,
			topCollections: topCollections.items,
		};
	}
}
