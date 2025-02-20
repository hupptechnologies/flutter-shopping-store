import { RelationKeys } from '../types/relations.type';

export interface FindTreeOptions<T> {
	relations?: RelationKeys<T>;
	depth?: number;
}
