import { SelectQueryBuilder } from 'typeorm';

SelectQueryBuilder.prototype.likeQuery = function <T>(
	columns: Array<keyof T>,
	value: string | undefined | null,
): void {
	if (!value) return;

	const query = `(${columns
		.map((column) => `${this.alias}.${column.toString()} LIKE :search`)
		.join(' OR ')})`;

	this.andWhere(query, {
		search: `%${value}%`,
	});
};
