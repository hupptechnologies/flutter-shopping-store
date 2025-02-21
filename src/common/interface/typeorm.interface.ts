import { RelationKeys } from '../types/relations.type';

export interface FindTreeOptions<T> {
	relations?: RelationKeys<T>;
	depth?: number;
}

export interface FindAllRes<T> {
	items: Array<T>;
	total: number;
}
