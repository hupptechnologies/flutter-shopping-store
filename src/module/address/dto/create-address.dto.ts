import {
	IsEnum,
	IsNotEmpty,
	IsOptional,
	IsPhoneNumber,
	IsString,
	MaxLength,
} from 'class-validator';
import { ErrorMsgConstant } from 'src/common/constant/error-msg.constant';
import { AddressType } from 'src/common/enum/address-type.enum';

export class CreateAddressDto {
	@IsString()
	@IsNotEmpty()
	@MaxLength(150)
	public receiverName: string;

	@IsString()
	@IsNotEmpty()
	@MaxLength(255)
	public street: string;

	@IsString()
	@IsNotEmpty()
	@MaxLength(100)
	public city: string;

	@IsString()
	@IsNotEmpty()
	@MaxLength(100)
	public state: string;

	@IsString()
	@IsNotEmpty()
	@MaxLength(10)
	public zipCode: string;

	@IsString()
	@IsNotEmpty()
	@MaxLength(100)
	public country: string;

	@IsEnum(AddressType)
	@IsOptional()
	public type?: AddressType;

	@IsPhoneNumber(undefined, {
		message: ErrorMsgConstant.INVALID_PHONE_NUMBER,
	})
	@IsOptional()
	public receiverPhone?: string;

	@IsOptional()
	public isDefault?: boolean;
}
