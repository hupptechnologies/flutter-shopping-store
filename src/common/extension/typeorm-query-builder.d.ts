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

SelectQueryBuilder.prototype.likeQuery = function <T>(
	columns: Array<keyof T>,
	value: string | undefined | null,
): void {
	if (!value) return;

	const query = columns
		.map((column) => `${this.alias}.${column.toString()} LIKE :search`)
		.join(' OR ');

	this.andWhere(query, {
		search: `%${value}%`,
	});
};

export {};
