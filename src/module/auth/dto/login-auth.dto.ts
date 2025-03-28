import { IsEmail, IsStrongPassword } from 'class-validator';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';
import { ValidationMsgConstant } from '../../../common/constant/validation-msg.constant';

export class LoginAuthDto {
	@IsNotEmpty()
	@IsEmail(undefined, {
		message: ValidationMsgConstant.IS_EMAIL,
	})
	public email: string;

	@IsNotEmpty()
	@IsStrongPassword(undefined, {
		message: ValidationMsgConstant.IS_STRONG_PASSWORD,
	})
	public password: string;
}
