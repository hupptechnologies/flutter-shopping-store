import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Voucher } from '../../module/voucher/entities/voucher.entity';
import { VoucherRepository } from './voucher.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Voucher])],
	providers: [VoucherRepository],
	exports: [VoucherRepository],
})
export class VoucherRepoModule {}
