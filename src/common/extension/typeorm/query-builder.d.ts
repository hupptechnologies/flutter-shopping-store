import { SelectQueryBuilder } from 'typeorm';

declare module 'typeorm' {
	export interface SelectQueryBuilder<Entity> {
		/**
		 * Apply a LIKE query on specific columns.
		 * @param columns An array of column names.
		 * @param value The search value.
		 */
		likeQuery(columns: Array<keyof Entity>, value: string | undefined | null): void;
	}
}

export { SelectQueryBuilder };
