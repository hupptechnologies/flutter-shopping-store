import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Voucher } from '../../module/voucher/entities/voucher.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateVoucherDto } from '../../module/voucher/dto/create-voucher.dto';
import { UpdateVoucherDto } from '../../module/voucher/dto/update-voucher.dto';
import { QueryOptionsDto } from 'src/common/dto/query-options.dto';
import { FindAllRes } from 'src/common/interface/typeorm.interface';
import { BaseRepository } from '../base.respository';

@Loggable()
@Injectable()
export class VoucherRepository extends BaseRepository {
	private readonly name: string = Voucher.name.toLowerCase();

	@InjectRepository(Voucher)
	private readonly repository: Repository<Voucher>;

	public async findByCode(code: string): Promise<Voucher | null> {
		return await this.repository.findOne({
			where: {
				code,
			},
		});
	}

	public async create(dto: CreateVoucherDto): Promise<Voucher> {
		const voucher = this.repository.create(dto);
		return await this.repository.save(voucher);
	}

	public async update(voucher: Voucher, dto: UpdateVoucherDto): Promise<Voucher> {
		Object.assign(voucher, dto);
		void this.repository.update(voucher.id, dto);
		return await this.repository.save(voucher);
	}

	public async findById(id: number): Promise<Voucher | null> {
		return await this.repository.findOne({
			where: {
				id,
			},
		});
	}

	public async findAll(queryOptionsDto: QueryOptionsDto): Promise<FindAllRes<Voucher>> {
		const query = this.repository.createQueryBuilder(this.name);

		if (queryOptionsDto.search) {
			query.likeQuery(['name', 'code'], queryOptionsDto.search);
		}

		query.orderBy(`${query.alias}.${queryOptionsDto.column}`, queryOptionsDto.orderBy);
		query.skip(queryOptionsDto.skip);
		query.take(queryOptionsDto.perPage);

		const result = await query.getManyAndCount();
		return {
			items: result[0],
			total: result[1],
		};
	}
}
