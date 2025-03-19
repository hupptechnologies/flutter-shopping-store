import { Exclude, Type } from 'class-transformer';
import { IsNumber, IsOptional, IsPositive, IsString } from 'class-validator';
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

	@Exclude({
		toPlainOnly: true,
	})
	@IsNumber()
	@Type(() => Number)
	public categoryId: number;

	@Exclude()
	public category: Category;
}
