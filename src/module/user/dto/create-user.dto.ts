import { IsEmail, IsEnum, IsMobilePhone, IsOptional } from 'class-validator';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { Gender } from 'src/common/enum/gender.enum';
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

	@IsOptional()
	@IsEnum(Gender, {
		message: ValidationMsgConstant.GENDER_ENUM,
	})
	public gender?: Gender;

	public image?: string;
}
