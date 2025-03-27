import { Exclude, Type } from 'class-transformer';
import { IsNumber, IsPositive, Min } from 'class-validator';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { Product } from 'src/module/product/entities/product.entity';
import { Variant } from 'src/module/variant/entities/variant.entity';

export class CreateCartDto {
	@IsNumber()
	@Min(0, {
		message: ValidationMsgConstant.QUANTITY_MIN_ZERO,
	})
	@Type(() => Number)
	public quantity: number;

	@IsNumber()
	@IsPositive()
	@Type(() => Number)
	public productId: number;

	@IsNumber()
	@IsPositive()
	@Type(() => Number)
	public variantId: number;

	@Exclude()
	public product: Product;

	@Exclude()
	public variant: Variant;

	@Exclude()
	public price: number;
}
