import { RelationKeys } from '../../types/relations.type';
import { SelectQueryBuilder } from 'typeorm';

SelectQueryBuilder.prototype.leftJoins = function <T>(relations?: RelationKeys<T>): void {
	if (!relations || !Array.isArray(relations)) return;

	relations.forEach((relation) => {
		this.leftJoinAndSelect(`${this.alias}.${relation.toString()}`, relation);
	});
	return;
};
