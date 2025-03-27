import { Injectable } from '@nestjs/common';
import { BaseEntity } from 'typeorm';

@Injectable()
export class BaseRepository {
	public async delete<T extends BaseEntity>(entity: T, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const deleteEntity = await entity.softRemove();
			return !!deleteEntity;
		}
		const deleteEntity = await entity.remove();
		return !!deleteEntity;
	}
}
