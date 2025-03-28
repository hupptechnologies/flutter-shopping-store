import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { instanceToPlain } from 'class-transformer';
import { map, Observable } from 'rxjs';
import { ApiResponse } from '../../common/interface/api-reponse.interface';

@Injectable()
export class ResponseInterceptor implements NestInterceptor {
	intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
		return next.handle().pipe(
			map((res: ApiResponse<unknown>) => {
				const response: ApiResponse<unknown> = {
					message: res.message,
					data: res.data ? instanceToPlain(res.data) : null,
				};
				return {
					error: false,
					...response,
				};
			}),
		);
	}
}
