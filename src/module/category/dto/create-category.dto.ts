import { IsEnum, IsOptional, IsString } from 'class-validator';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';
import { Category } from '../entities/category.entity';
import { Gender } from 'src/common/enum/gender.enum';

export class CreateCategoryDto {
	@IsNotEmpty()
	public name: string;

	@IsOptional()
	@IsString()
	public description?: string;

	@IsOptional()
	@IsString()
	public color?: string;

	@IsOptional()
	@IsEnum(Gender)
	public gender?: Gender;

	@IsOptional()
	public parentId?: number;

	public parent?: Category;
}
