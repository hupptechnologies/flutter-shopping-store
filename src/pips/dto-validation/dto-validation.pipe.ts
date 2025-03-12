import { ArgumentMetadata, Injectable, PipeTransform } from '@nestjs/common';
import { ClassConstructor, plainToInstance } from 'class-transformer';
import { validate, ValidationError } from 'class-validator';
import { ValidationException } from 'src/exceptions/validation.exception';

@Injectable()
export class DtoValidationPipe implements PipeTransform {
	async transform<T extends object>(value: T, { metatype }: ArgumentMetadata): Promise<any> {
		if (!metatype || !this.toValidate(metatype)) {
			return value;
		}

		const object = plainToInstance(metatype as ClassConstructor<T>, value);
		const errors: Array<ValidationError> = await validate(object);

		if (errors.length > 0) {
			const formatErrors: Map<string, Array<string>> = new Map();
			errors.forEach((err) => {
				formatErrors.set(err.property, Object.values(err.constraints ?? []));
			});
			throw new ValidationException(Object.fromEntries(formatErrors));
		}
		return object;
	}

	private toValidate(metatype: Function): boolean {
		return ![String, Boolean, Number, Array, Object].includes(metatype as never);
	}
}
