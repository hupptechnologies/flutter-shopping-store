import { IsOptional, IsString } from 'class-validator';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';
import { Category } from '../entities/category.entity';

export class CreateCategoryDto {
	@IsNotEmpty()
	public name: string;

	@IsOptional()
	@IsString()
	public description?: string;

	@IsOptional()
	public parentId?: number;

	public parent?: Category;
}
