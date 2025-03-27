import { Type } from 'class-transformer';
import { IsNumber } from 'class-validator';

export class UpdateCartDto {
	@IsNumber()
	@Type(() => Number)
	public quantity: number;
}
