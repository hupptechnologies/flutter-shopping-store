import { Exclude, Expose, Type } from 'class-transformer';
import { IsInt, IsOptional } from 'class-validator';
import { ValidationMsgConstant } from '../constant/validation-msg.constant';

export class QueryOptionsDto {
	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@Type(() => Number)
	@IsInt({
		message: ValidationMsgConstant.PAGE_INTEGET,
	})
	public page?: number = 1;

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@Type(() => Number)
	@IsInt({
		message: ValidationMsgConstant.LIMIT_INTEGET,
	})
	public limit?: number = 10;

	@Expose()
	public get currentPage(): number {
		return this.page ?? 1;
	}

	@Expose()
	public get perPage(): number {
		return this.limit ?? 10;
	}

	@Exclude({
		toClassOnly: true,
	})
	public total: number = 0;

	@Exclude({
		toClassOnly: true,
	})
	public totalPage: number = 0;

	public setTotal(total: number): void {
		this.total = total;
		this.totalPage = Math.ceil(total / this.perPage);
	}

	public get skip(): number {
		return this.currentPage * this.perPage;
	}
}
