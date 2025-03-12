import { BadRequestException, HttpStatus } from '@nestjs/common';

export class ValidationException extends BadRequestException {
	public readonly errors: Record<string, Array<string>>;
	constructor(errors: Record<string, Array<string>>) {
		super({
			statusCode: HttpStatus.BAD_REQUEST,
			message: 'Validation failed',
			errors,
			error: 'Bad Request',
		});
		this.errors = errors;
	}
}
