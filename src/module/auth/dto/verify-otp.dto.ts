import { Max, Min } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';
import { ValidationMsgConstant } from 'src/common/constant/validation-msg.constant';

export class VerifyOtpDto extends ForgetPasswordDto {
	@Min(1000, {
		message: ValidationMsgConstant.INVALID_OTP_LENGTH,
	})
	@Max(9999, {
		message: ValidationMsgConstant.INVALID_OTP_LENGTH,
	})
	public otp: number;
}
