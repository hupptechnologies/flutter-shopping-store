import { IsString, IsNotEmpty, IsStrongPassword } from 'class-validator';
import { ForgetPasswordDto } from './forget-password.dto';

export class ResetPasswordDto extends ForgetPasswordDto {
	@IsString()
	@IsNotEmpty()
	@IsStrongPassword()
	public password: string;
}
