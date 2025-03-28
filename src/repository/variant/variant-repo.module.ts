import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Variant } from '../../module/variant/entities/variant.entity';
import { VariantRepository } from './variant.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Variant])],
	providers: [VariantRepository],
	exports: [VariantRepository],
})
export class VariantRepoModule {}
