import { Module } from '@nestjs/common';
import { VariantService } from './variant.service';
import { VariantController } from './variant.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Variant } from './entities/variant.entity';
import { VariantRepository } from './variant.repository';
import { ImageModule } from '../image/image.module';

@Module({
	imports: [TypeOrmModule.forFeature([Variant]), ImageModule],
	controllers: [VariantController],
	providers: [VariantService, VariantRepository],
})
export class VariantModule {}
