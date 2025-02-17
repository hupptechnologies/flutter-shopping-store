import { IsEmail, IsStrongPassword } from 'class-validator';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

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
