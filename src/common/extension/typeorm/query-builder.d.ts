import { RelationKeys } from 'src/common/types/relations.type';
import { SelectQueryBuilder } from 'typeorm';

declare module 'typeorm' {
	export interface SelectQueryBuilder<Entity> {
		/**
		 * Applies a `LIKE` filter on specified columns to enable search functionality.
		 * If the `value` is `undefined` or `null`, the filter is not applied.
		 *
		 * @template Entity - The entity type being queried.
		 * @param columns - An array of column names where the `LIKE` search should be applied.
		 * @param value - The search term to filter the results. If `undefined` or `null`, no filtering occurs.
		 *
		 * @example
		 * ```typescript
		 * query.likeQuery(['name', 'description'], 'electronics');
		 * ```
		 * This generates the following SQL:
		 * ```sql
		 * WHERE name LIKE '%electronics%' OR description LIKE '%electronics%'
		 * ```
		 */
		likeQuery(columns: Array<keyof Entity>, value: string | undefined | null): void;

		/**
		 * Performs a `LEFT JOIN` and selects the specified relations for the entity.
		 * This method dynamically applies `leftJoinAndSelect` to all relations provided.
		 *
		 * @template Entity - The entity type being queried.
		 * @param relations - An array of relation keys to join and select.
		 *                    If `undefined` or empty, no joins are applied.
		 *
		 * @example
		 * ```typescript
		 * query.leftJoins(['leftJoin1', 'leftJoin2']);
		 * ```
		 * This will generate:
		 * ```sql
		 * LEFT JOIN category.leftJoin1 leftJoin1
		 * LEFT JOIN category.leftJoin2 leftJoin2
		 * ```
		 */
		leftJoins(relations?: RelationKeys<Entity>): void;
	}
}

export { SelectQueryBuilder };
