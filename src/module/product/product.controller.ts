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
import { ProductService } from './product.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Product } from './entities/product.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Public } from 'src/decorator/public/public.decorator';
import { PaginationRes } from 'src/common/interface/pagination-res.interface';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';
import { DashboardList } from 'src/common/interface/dashboard-list.interface';

@Controller(URLConstant.PRODUCT)
export class ProductController {
	constructor(private readonly productService: ProductService) {}

	@Post()
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	async create(
		@Body() createProductDto: CreateProductDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Product> {
		const product = await this.productService.create(createProductDto, files);
		return {
			data: product,
			message: MessageConstant.PRODUCT_CREATED_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateProductDto: UpdateProductDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): Promise<APIResponse<Product>> {
		const product = await this.productService.update(id, updateProductDto, files);
		return {
			data: product,
			message: MessageConstant.PRODUCT_UPDATED_SUCCESS,
		};
	}

	@Public()
	@Get(URLConstant.ROUTER_ID)
	async findOne(@Param(KeyConstant.ID, ParseIntPipe) id: number): Promise<APIResponse<Product>> {
		const product = await this.productService.findOne(id);
		return {
			data: product,
			message: MessageConstant.PRODUCT_FETCHED_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(@Param(KeyConstant.ID, ParseIntPipe) id: number): Promise<APIResponse<boolean>> {
		const isDelete = await this.productService.delete(id);
		return {
			data: isDelete,
			message: MessageConstant.PRODUCT_DELETED_SUCCESS,
		};
	}

	@Get()
	async findAll(@Query() queryOptionsDto: QueryOptionsDto): APIResponse<PaginationRes<Product>> {
		const products = await this.productService.findAll(queryOptionsDto);
		return {
			data: products,
			message: MessageConstant.PRODUCT_FETCHED_SUCCESS,
		};
	}

	@Get(URLConstant.ALL)
	async fetchDashboardData(
		@Query() queryOptionsDto: QueryOptionsDto,
	): Promise<APIResponse<DashboardList>> {
		const products = await this.productService.fetchDashboardData(queryOptionsDto);
		return {
			data: products,
			message: MessageConstant.DASHBAORD_FETCHED_SUCCESS,
		};
	}
}
