import { IsStrongPassword } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

export class ResetPasswordDto extends ForgetPasswordDto {
	@IsNotEmpty()
	@IsStrongPassword(undefined, {
		message: ValidationMsgConstant.IS_STRONG_PASSWORD,
	})
	public password: string;
}
