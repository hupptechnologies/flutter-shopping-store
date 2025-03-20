import { Exclude, Expose, Type } from 'class-transformer';
import { IsEnum, IsInt, IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';
import { ValidationMsgConstant } from '../constant/validation-msg.constant';
import { OrderBy } from '../enum/sort-by.enum';
import { Gender } from '../enum/gender.enum';

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

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@IsNotEmpty({
		message: ValidationMsgConstant.SEARCH_NOT_EMPTY,
	})
	public search: string;

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@IsString()
	public orderColumn?: string = 'id';

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@IsEnum(OrderBy)
	public order?: OrderBy = OrderBy.ASC;

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@Type(() => Number)
	public categoryId?: number;

	// Pagination
	public get orderBy(): OrderBy {
		return this.order ?? OrderBy.ASC;
	}

	public get column(): string {
		return this.orderColumn ?? 'id';
	}

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
		return (this.currentPage - 1) * this.perPage;
	}

	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@IsEnum(Gender)
	public gender?: Gender;

	// category
	@Exclude({
		toPlainOnly: true,
	})
	@IsOptional()
	@IsNumber()
	@Type(() => Number)
	public depth?: number;
}
