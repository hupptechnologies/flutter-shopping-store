import { IsNumber, IsOptional, Max, Min } from 'class-validator';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

export class CreateReviewDto {
	@IsNotEmpty()
	public comment: string;

	@IsOptional()
	@IsNumber()
	public productId?: number;

	@IsNotEmpty()
	@IsNumber({
		maxDecimalPlaces: 1,
	})
	@Min(0)
	@Max(5)
	public rating: number;
}
