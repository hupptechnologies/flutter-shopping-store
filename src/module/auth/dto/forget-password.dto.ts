import { IsEmail } from 'class-validator';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

export class ForgetPasswordDto {
	@IsNotEmpty()
	@IsEmail(undefined, {
		message: ValidationMsgConstant.IS_EMAIL,
	})
	public email: string;
}
