import { Body, Controller, Post, UploadedFiles, UseInterceptors } from '@nestjs/common';
import { VariantService } from './variant.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Variant } from './entities/variant.entity';
import { CreateVariantDto } from './dto/create-variant.dto';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { MessageConstant } from 'src/common/constant/message.constant';

@Controller(URLConstant.VARIANT)
export class VariantController {
	constructor(private readonly variantService: VariantService) {}

	@Post()
	@UseInterceptors(FilesInterceptor(KeyConstant.IMAGES, KeyConstant.MAX_IMAGES_LENGTH))
	public async create(
		@Body() createVariantDto: CreateVariantDto,
		@UploadedFiles() files: Array<Express.Multer.File>,
	): APIResponse<Variant> {
		const createVariant = await this.variantService.create(createVariantDto, files);
		return {
			message: MessageConstant.VARIANT_CREATED_SUCCESS,
			data: createVariant,
		};
	}
}
