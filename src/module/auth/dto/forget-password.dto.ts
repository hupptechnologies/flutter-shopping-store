import { IsEmail } from 'class-validator';
import { ValidationMsgConstant } from '../../../common/constant/validation-msg.constant';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';

export class ForgetPasswordDto {
	@IsNotEmpty()
	@IsEmail(undefined, {
		message: ValidationMsgConstant.IS_EMAIL,
	})
	public email: string;
}
