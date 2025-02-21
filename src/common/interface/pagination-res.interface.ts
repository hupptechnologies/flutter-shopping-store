import { QueryOptionsDto } from '../dto/query-options.dto';

export interface PaginationRes<T> {
	items: Array<T>;
	meta: QueryOptionsDto;
}
