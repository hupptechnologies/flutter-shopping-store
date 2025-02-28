import { Body, Controller, Post, UploadedFiles, UseInterceptors } from '@nestjs/common';
import { ProductService } from './product.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Product } from './entities/product.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateProdctDto } from './dto/create-prodcut.dto';

@Controller(URLConstant.PRODUCT)
export class ProductController {
	constructor(private readonly productService: ProductService) {}

	@Post()
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	async create(
		@Body() createProdctDto: CreateProdctDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Product> {
		const product = await this.productService.create(createProdctDto, files);
		return {
			data: product,
			message: MessageConstant.PRODCUT_CREATED_SUCCESS,
		};
	}
}
