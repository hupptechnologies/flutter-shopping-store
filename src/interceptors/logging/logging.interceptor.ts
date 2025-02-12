import { CallHandler, ExecutionContext, Injectable, Logger, NestInterceptor } from '@nestjs/common';
import { Request } from 'express';
import { Observable, tap } from 'rxjs';

@Injectable()
export class LoggingInterceptor implements NestInterceptor {
	private readonly logger = new Logger(LoggingInterceptor.name);

	intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
		const request = context.switchToHttp().getRequest<Request>();
		const { method, url } = request;
		const now = Date.now();

		this.logger.verbose(`Request started: ${method} ${url}`);
		return next.handle().pipe(
			tap(() => {
				const responseTime = Date.now() - now;
				this.logger.verbose(`Request ended: ${method} ${url} - ${responseTime}ms`);
			}),
		);
	}
}
