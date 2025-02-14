import { ApiResponse } from '../interface/api-reponse.interface';

export type APIResponse<T> = Promise<ApiResponse<T>>;
