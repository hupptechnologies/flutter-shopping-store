import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Voucher } from 'src/module/voucher/entities/voucher.entity';
import { VoucherRepository } from 'src/repository/voucher/voucher.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Voucher])],
	providers: [VoucherRepository],
	exports: [VoucherRepository],
})
export class VoucherRepoModule {}
