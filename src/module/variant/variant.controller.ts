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
import { VariantService } from './variant.service';
import { FilesInterceptor } from '@nestjs/platform-express';
import { KeyConstant } from '../../common/constant/key.constant';
import { MessageConstant } from '../../common/constant/message.constant';
import { URLConstant } from '../../common/constant/url.constant';
import { APIResponse } from '../../common/types/api-response.type';
import { CreateVariantDto } from './dto/create-variant.dto';
import { QueryVariantDto } from './dto/query-variant.dto';
import { UpdateVariantDto } from './dto/update-variant.dto';
import { Variant } from './entities/variant.entity';

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
			data: createVariant,
			message: MessageConstant.VARIANT_CREATED_SUCCESS,
		};
	}

	@Get(URLConstant.ALL)
	public async findAll(@Query() queryVariantDto: QueryVariantDto): APIResponse<Array<Variant>> {
		const variants = await this.variantService.findAll(queryVariantDto);
		return {
			data: variants,
			message: MessageConstant.VARIANT_FETCHED_SUCCESS,
		};
	}

	@Get(URLConstant.ROUTER_ID)
	public async findOne(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<Variant> {
		const variant = await this.variantService.findOne(id);
		return {
			data: variant,
			message: MessageConstant.VARIANT_FOUND_SUCCESS,
		};
	}

	@Patch(URLConstant.ROUTER_ID)
	public async update(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@Body() updateVariantDto: UpdateVariantDto,
	): APIResponse<Variant> {
		const variant = await this.variantService.update(id, updateVariantDto);
		return {
			data: variant,
			message: MessageConstant.VARIANT_UPDATED_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	public async delete(@Param(KeyConstant.ID, ParseIntPipe) id: number): APIResponse<boolean> {
		const isSoftDetele = await this.variantService.delete(id);
		return {
			data: isSoftDetele,
			message: MessageConstant.VARIANT_DELETED_SUCCESS,
		};
	}
}
