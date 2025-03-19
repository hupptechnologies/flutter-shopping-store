import { Module } from '@nestjs/common';
import { VariantService } from './variant.service';
import { VariantController } from './variant.controller';
import { ImageModule } from '../image/image.module';
import { VariantRepoModule } from 'src/repository/variant/variant-repo.module';
import { ProductRepoModule } from 'src/repository/product/product-repo.module';

@Module({
	imports: [VariantRepoModule, ProductRepoModule, ImageModule],
	controllers: [VariantController],
	providers: [VariantService],
})
export class VariantModule {}
