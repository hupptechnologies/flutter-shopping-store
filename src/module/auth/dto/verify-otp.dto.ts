import { Max, Min } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';
import { IsNotEmpty } from 'src/decorator/validation/is-not-empty.decorator';

export class VerifyOtpDto extends ForgetPasswordDto {
	@IsNotEmpty()
	@Min(100000, {
		message: ValidationMsgConstant.INVALID_OTP_LENGTH,
	})
	@Max(999999, {
		message: ValidationMsgConstant.INVALID_OTP_LENGTH,
	})
	public otp: number;
}
