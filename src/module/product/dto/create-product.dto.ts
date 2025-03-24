import { Exclude, Type } from 'class-transformer';
import { IsEnum, IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
import { ProductTypeEnum } from 'src/common/enum/product-type.enum';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';
import { Category } from 'src/module/category/entities/category.entity';

export class CreateProductDto {
	@IsNotEmpty()
	public name: string;

	@IsOptional()
	@IsString()
	public description?: string;

	@IsNumber()
	@IsPositive()
	@Type(() => Number)
	public price: number;

	@IsOptional()
	@IsEnum(ProductTypeEnum)
	public type?: ProductTypeEnum;

	@Exclude({
		toPlainOnly: true,
	})
	@IsNumber()
	@Type(() => Number)
	public categoryId: number;

	@Exclude()
	public category: Category;
}
