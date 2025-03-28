import { Module } from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { VoucherController } from './voucher.controller';
import { VoucherRepoModule } from '../../repository/voucher/voucher-repo.module';

@Module({
	imports: [VoucherRepoModule],
	controllers: [VoucherController],
	providers: [VoucherService],
})
export class VoucherModule {}
