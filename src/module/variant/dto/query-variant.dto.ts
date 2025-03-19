import { Type } from 'class-transformer';
import { IsNumber } from 'class-validator';

export class QueryVariantDto {
	@IsNumber()
	@Type(() => Number)
	public productId: number;
}
