import { BaseEntity } from 'typeorm';

type ExcludeBaseEntity<T> = Omit<T, keyof BaseEntity>;

type RelationKey<T> = Extract<
	keyof ExcludeBaseEntity<T>,
	{
		[K in keyof ExcludeBaseEntity<T>]: ExcludeBaseEntity<T>[K] extends Date
			? never
			: ExcludeBaseEntity<T>[K] extends Array<any>
				? K
				: ExcludeBaseEntity<T>[K] extends object
					? K
					: never;
	}[keyof ExcludeBaseEntity<T>]
>;

export type RelationKeys<T> = Array<RelationKey<T>>;
