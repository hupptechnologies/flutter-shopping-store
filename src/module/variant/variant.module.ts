import { Module } from '@nestjs/common';
import { VariantService } from './variant.service';
import { VariantController } from './variant.controller';
import { ImageModule } from '../image/image.module';
import { VariantRepoModule } from 'src/repository/variant/variant-repo.module';

@Module({
	imports: [VariantRepoModule, ImageModule],
	controllers: [VariantController],
	providers: [VariantService],
})
export class VariantModule {}
