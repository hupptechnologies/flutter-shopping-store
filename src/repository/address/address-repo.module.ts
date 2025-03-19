import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Address } from 'src/module/address/entities/address.entity';
import { AddressRepository } from './address.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Address])],
	providers: [AddressRepository],
	exports: [AddressRepository],
})
export class AddressRepoModule {}
