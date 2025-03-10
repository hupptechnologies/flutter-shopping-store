import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Voucher } from './entities/voucher.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Loggable()
@Injectable()
export class VoucherRepository {
	constructor(
		@InjectRepository(Voucher)
		private readonly repository: Repository<Voucher>,
	) {}
}
