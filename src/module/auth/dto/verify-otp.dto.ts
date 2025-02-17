import { IsNotEmpty, IsNumber, Max, Min } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';

export class VerifyOtpDto extends ForgetPasswordDto {
	@IsNotEmpty()
	@IsNumber()
	@Min(100000)
	@Max(999999)
	public otp: number;
}
