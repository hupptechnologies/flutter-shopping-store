import { IsStrongPassword } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';
import { ValidationMsgConstant } from '../../../common/constant/validation-msg.constant';

export class ResetPasswordDto extends ForgetPasswordDto {
	@IsNotEmpty()
	@IsStrongPassword(undefined, {
		message: ValidationMsgConstant.IS_STRONG_PASSWORD,
	})
	public password: string;
}
