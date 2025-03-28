import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AddressRepository } from './address.repository';
import { Address } from '../../module/address/entities/address.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Address])],
	providers: [AddressRepository],
	exports: [AddressRepository],
})
export class AddressRepoModule {}
