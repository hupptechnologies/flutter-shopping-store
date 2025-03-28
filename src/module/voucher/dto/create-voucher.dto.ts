import { Type } from 'class-transformer';
import { IsBoolean, IsDate, IsEnum, IsNumber, IsOptional, Min } from 'class-validator';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';
import { DiscountEnum } from '../../../common/enum/discount.enum';

export class CreateVoucherDto {
	@IsNotEmpty()
	public name: string;

	@IsOptional()
	@IsBoolean()
	public firstOrder?: boolean;

	@IsNotEmpty()
	public code: string;

	@IsEnum(DiscountEnum)
	public discountType: DiscountEnum;

	@IsNumber()
	@Min(0)
	public discountValue: number;

	@IsOptional()
	@IsNumber()
	@Min(0)
	public minOrderValue?: number;

	@IsOptional()
	@IsNumber()
	@Min(0)
	public maxDiscount?: number;

	@IsOptional()
	@Type(() => Date)
	@IsDate()
	public validFrom?: Date;

	@IsDate()
	@Type(() => Date)
	public validTo: Date;

	@IsNumber()
	@Min(1)
	public usageLimit: number;

	@IsOptional()
	@IsNumber()
	@Min(0)
	public usedCount?: number;

	@IsOptional()
	public userSpecific?: boolean;
}
