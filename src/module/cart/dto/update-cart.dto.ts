import { Type } from 'class-transformer';
import { IsBoolean, IsNumber, IsOptional } from 'class-validator';

export class UpdateCartDto {
	@IsOptional()
	@IsNumber()
	@Type(() => Number)
	public quantity: number;

	@IsOptional()
	@IsBoolean()
	public isSelected: boolean;
}
