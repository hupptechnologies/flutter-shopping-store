import { IsInt, IsNumber, IsOptional, IsPositive, IsString, MinLength } from 'class-validator';

export class CreateVariantDto {
	@IsString()
	@MinLength(2)
	public color: string;

	@IsString()
	@MinLength(1)
	public size: string;

	@IsNumber()
	@IsPositive()
	public price: number;

	@IsInt()
	@IsOptional()
	public stock?: number;

	@IsInt()
	public productId: number;
}
