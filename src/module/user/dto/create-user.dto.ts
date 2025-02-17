import { IsEmail, IsMobilePhone, IsOptional } from 'class-validator';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

export class CreateUserDto {
	@IsNotEmpty()
	public firstName: string;

	@IsNotEmpty()
	public lastName: string;

	@IsEmail(undefined, {
		message: ValidationMsgConstant.IS_EMAIL,
	})
	@IsNotEmpty()
	public email: string;

	@IsNotEmpty()
	public password: string;

	@IsOptional()
	@IsMobilePhone(undefined, undefined, {
		message: ValidationMsgConstant.PHONE_NUMBER,
	})
	public mobileNumber?: string;

	public image?: string;
}
