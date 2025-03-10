import { Module } from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { VoucherController } from './voucher.controller';
import { VoucherRepository } from './voucher.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Voucher } from './entities/voucher.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Voucher])],
	controllers: [VoucherController],
	providers: [VoucherService, VoucherRepository],
})
export class VoucherModule {}
