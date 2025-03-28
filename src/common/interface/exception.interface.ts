import {
	BadRequestException,
	ForbiddenException,
	HttpException,
	NotFoundException,
	UnauthorizedException,
} from '@nestjs/common';
import { QueryFailedError } from 'typeorm';
import { ValidationException } from '../../exceptions/validation.exception';

export type ExceptionType =
	| HttpException
	| QueryFailedError
	| ForbiddenException
	| BadRequestException
	| NotFoundException
	| ValidationException
	| Error
	| UnauthorizedException;
