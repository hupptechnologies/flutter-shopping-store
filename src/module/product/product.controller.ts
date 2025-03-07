import {
	Body,
	Controller,
	Get,
	Param,
	ParseIntPipe,
	Patch,
	Post,
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
			message: MessageConstant.PRODCUT_CREATED_SUCCESS,
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
			message: MessageConstant.PRODCUT_UPDATED_SUCCESS,
		};
	}

	@Public()
	@Get(URLConstant.ROUTER_ID)
	async findOne(@Param(KeyConstant.ID, ParseIntPipe) id: number): Promise<APIResponse<Product>> {
		const product = await this.productService.findOne(id);
		return {
			data: product,
			message: MessageConstant.PRODCUT_FETCHED_SUCCESS,
		};
	}
}
