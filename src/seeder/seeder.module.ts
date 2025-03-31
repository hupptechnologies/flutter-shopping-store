import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ShippingMothod } from '../module/shipping-mothod/entities/shpping-method.entity';
import { ShippinMethodSeed } from './seed/shipping-method.seed';
import { SeederService } from './seeder.service';
import { UserModule } from '../module/user/user.module';
import { UserSeed } from './seed/user.seed';

@Module({
	imports: [TypeOrmModule.forFeature([ShippingMothod]), UserModule],
	providers: [SeederService, ShippinMethodSeed, UserSeed],
	exports: [SeederService],
})
export class SeederModule {}
