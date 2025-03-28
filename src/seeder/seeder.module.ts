import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ShippingMothod } from '../module/shipping-mothod/entities/shpping-method.entity';
import { ShippinMethodSeed } from './seed/shipping-method.seed';
import { SeederService } from './seeder.service';

@Module({
	imports: [TypeOrmModule.forFeature([ShippingMothod])],
	providers: [SeederService, ShippinMethodSeed],
	exports: [SeederService],
})
export class SeederModule {}
