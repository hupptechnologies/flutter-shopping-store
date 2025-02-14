import {
	ArgumentsHost,
	BadRequestException,
	Catch,
	ExceptionFilter,
	HttpException,
	HttpStatus,
	Logger,
	NotFoundException,
	UnauthorizedException,
} from '@nestjs/common';
import { Response } from 'express';
import { KeyConstant } from 'src/common/constant/key.constant';
import { ExceptionType } from 'src/common/interface/exception.interface';
import { QueryFailedError } from 'typeorm';
import { ValidationException } from './validation.exception';
import { ErrorMsgConstant } from 'src/common/constant/error-msg.constant';

@Catch()
export class GlobalExceptionsFilter implements ExceptionFilter {
	private readonly logger = new Logger(GlobalExceptionsFilter.name);

	catch(exception: ExceptionType, host: ArgumentsHost): void {
		const ctx = host.switchToHttp();
		const response = ctx.getResponse<Response>();
		const request = ctx.getRequest<Request>();

		const { status, message, data } = this.getErrorResponse(exception, response);

		this.logger.error(
			`Error occurred at ${request.url}: ${message} ${data ? JSON.stringify(data) : ''}`,
		);

		response
			.status(status)
			.json({
				error: true,
				message,
				data: data ?? null,
			})
			.send();
	}

	private getErrorResponse(
		exception: ExceptionType,
		response: Response,
	): { status: number; message: string; data?: Record<string, Array<string>> } {
		switch (true) {
			case exception instanceof ValidationException:
				return {
					status: HttpStatus.BAD_REQUEST,
					message: exception.message,
					data: exception.errors,
				};
			case exception instanceof UnauthorizedException:
				response.clearCookie(KeyConstant.ACCESS_TOKEN);
				response.clearCookie(KeyConstant.REFRESH_TOKEN);
				return {
					status: HttpStatus.UNAUTHORIZED,
					message: ErrorMsgConstant.UNAUTHORIZED,
				};
			case exception instanceof NotFoundException:
			case exception instanceof BadRequestException:
				return {
					status: exception.getStatus(),
					message: exception.message,
				};

			case exception instanceof QueryFailedError:
			case exception instanceof Error:
			case exception instanceof HttpException:
				return {
					status: HttpStatus.BAD_REQUEST,
					message: exception.message ?? ErrorMsgConstant.DATABASE_ERROR,
				};
			default:
				return {
					status: HttpStatus.INTERNAL_SERVER_ERROR,
					message: ErrorMsgConstant.SOMETHING_WRONG,
				};
		}
	}
}
