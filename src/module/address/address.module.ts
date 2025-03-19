import { Module } from '@nestjs/common';
import { AddressService } from './address.service';
import { AddressController } from './address.controller';
import { AddressRepoModule } from 'src/repository/address/address-repo.module';

@Module({
	imports: [AddressRepoModule],
	controllers: [AddressController],
	providers: [AddressService],
})
export class AddressModule {}
