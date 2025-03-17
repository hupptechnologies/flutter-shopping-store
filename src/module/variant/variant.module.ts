import { Module } from '@nestjs/common';
import { VariantService } from './variant.service';
import { VariantController } from './variant.controller';

@Module({
  controllers: [VariantController],
  providers: [VariantService],
})
export class VariantModule {}
