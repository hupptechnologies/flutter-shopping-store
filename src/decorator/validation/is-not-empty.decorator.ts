import { Injectable } from '@nestjs/common';
import {
	ValidationArguments,
	ValidationOptions,
	ValidatorConstraint,
	ValidatorConstraintInterface,
} from 'class-validator';
import { registerDecorator } from 'class-validator';
import { KeyConstant } from 'src/common/constant/key.constant';

@ValidatorConstraint({
	name: KeyConstant.IS_NOT_EMPTY,
	async: false,
})
@Injectable()
class IsNotEmptyValidator implements ValidatorConstraintInterface {
	validate(value: unknown): Promise<boolean> | boolean {
		if (typeof value !== 'string' || value.trim() === '') {
			return false;
		}
		return true;
	}
	defaultMessage(args: ValidationArguments): string {
		const result = args.property.replace(/([a-z0-9])([A-Z])/g, '$1 $2');
		const fieldName = result.charAt(0).toUpperCase() + result.slice(1);
		return `${fieldName} is required`;
	}
}

export function IsNotEmpty(validationOptions?: ValidationOptions) {
	return function (object: object, propertyName: string): void {
		registerDecorator({
			name: KeyConstant.IS_NOT_EMPTY,
			target: object.constructor,
			propertyName,
			options: validationOptions,
			validator: IsNotEmptyValidator,
		});
	};
}
