import { IsEmail, IsNotEmpty, IsString, IsStrongPassword } from 'class-validator';

export class LoginAuthDto {
	@IsString()
	@IsNotEmpty()
	@IsEmail()
	public email: string;

	@IsString()
	@IsNotEmpty()
	@IsStrongPassword()
	public password: string;
}
