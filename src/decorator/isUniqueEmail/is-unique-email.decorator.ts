import { Injectable } from '@nestjs/common';
import {
	registerDecorator,
	ValidationArguments,
	ValidationOptions,
	ValidatorConstraint,
	ValidatorConstraintInterface,
} from 'class-validator';
import { KeyConstant } from 'src/common/constant/key.constant';
import { MessageConstant } from 'src/common/constant/message.constant';
import { UserRepository } from 'src/module/user/user.repository';

@ValidatorConstraint({
	name: KeyConstant.IS_UNIQUE_EMAIL,
	async: true,
})
@Injectable()
export class IsUniqueEmailConstraint implements ValidatorConstraintInterface {
	constructor(private readonly userRepository: UserRepository) {}

	async validate(email: string, args: ValidationArguments): Promise<boolean> {
		const object = args.object as { id?: number };
		const userId = object.id;

		const existingUser = await this.userRepository.findOnByEmail(email);

		if (!existingUser) return true;
		if (existingUser.id === userId && userId) return true;
		return false;
	}

	defaultMessage(): string {
		return MessageConstant.EMAIL_EXISTS;
	}
}

export function IsUniqueEmail(validationOptions?: ValidationOptions) {
	return function (object: object, propertyName: string): void {
		registerDecorator({
			name: KeyConstant.IS_UNIQUE_EMAIL,
			target: object.constructor,
			propertyName,
			options: validationOptions,
			validator: IsUniqueEmailConstraint,
		});
	};
}
