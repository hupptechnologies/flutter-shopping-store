import {
	BadRequestException,
	ForbiddenException,
	HttpException,
	NotFoundException,
	UnauthorizedException,
} from '@nestjs/common';
import { ValidationException } from 'src/exceptions/validation.exception';
import { QueryFailedError } from 'typeorm';

export type ExceptionType =
	| HttpException
	| QueryFailedError
	| ForbiddenException
	| BadRequestException
	| NotFoundException
	| ValidationException
	| Error
	| UnauthorizedException;
