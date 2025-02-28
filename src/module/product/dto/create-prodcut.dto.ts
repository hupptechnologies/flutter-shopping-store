import { Exclude } from 'class-transformer';
import { IsNumber, IsOptional, IsString } from 'class-validator';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';
import { Category } from 'src/module/category/entities/category.entity';

export class CreateProdctDto {
	@IsNotEmpty()
	public name: string;

	@IsOptional()
	@IsString()
	public description?: string;

	@IsNumber()
	public categoryId: number;

	@Exclude()
	public category: Category;
}
