import { IsEnum, IsOptional, IsPhoneNumber, MaxLength } from 'class-validator';
import { ValidationMsgConstant } from '../../../common/constant/validation-msg.constant';
import { AddressType } from '../../../common/enum/address-type.enum';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';

export class CreateAddressDto {
	@IsNotEmpty()
	@MaxLength(150)
	public receiverName: string;

	@IsNotEmpty()
	@MaxLength(255)
	public street: string;

	@IsNotEmpty()
	@MaxLength(100)
	public city: string;

	@IsNotEmpty()
	@MaxLength(100)
	public state: string;

	@IsNotEmpty()
	@MaxLength(10)
	public zipCode: string;

	@IsNotEmpty()
	@MaxLength(100)
	public country: string;

	@IsEnum(AddressType)
	@IsOptional()
	public type?: AddressType;

	@IsPhoneNumber(undefined, {
		message: ValidationMsgConstant.PHONE_NUMBER,
	})
	@IsOptional()
	public receiverPhone?: string;
}
