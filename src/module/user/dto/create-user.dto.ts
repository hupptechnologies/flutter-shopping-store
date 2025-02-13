import { IsEmail, IsMobilePhone, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateUserDto {
	@IsString()
	@IsNotEmpty()
	public firstName: string;

	@IsString()
	@IsNotEmpty()
	public lastName: string;

	@IsEmail()
	@IsNotEmpty()
	public email: string;

	@IsString()
	@IsNotEmpty()
	public password: string;

	@IsOptional()
	@IsMobilePhone()
	public mobileNumber?: string;

	public image?: string;
}
