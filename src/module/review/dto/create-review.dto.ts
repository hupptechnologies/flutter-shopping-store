import { Type } from 'class-transformer';
import { IsNotEmpty, IsNumber, IsOptional, Max, Min } from 'class-validator';
import { IsNotEmpty as IsNotEmptyDecorator } from 'src/decorator/validation/is-not-empty.decorator';
import { Product } from 'src/module/product/entities/product.entity';

export class CreateReviewDto {
	@IsNotEmptyDecorator()
	public comment: string;

	@IsOptional()
	@IsNumber()
	@Type(() => Number)
	public productId?: number;

	@IsNotEmpty()
	@IsNumber({
		maxDecimalPlaces: 1,
	})
	@Min(0)
	@Max(5)
	@Type(() => Number)
	public rating: number;

	public product?: Product;
}
