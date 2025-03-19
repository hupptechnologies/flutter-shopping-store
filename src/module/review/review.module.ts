import { Module } from '@nestjs/common';
import { ReviewService } from './review.service';
import { ReviewController } from './review.controller';
import { ImageModule } from '../image/image.module';
import { ProductRepoModule } from 'src/repository/product/product-repo.module';
import { ReviewRepoModule } from 'src/repository/review/review-repo.module';

@Module({
	imports: [ReviewRepoModule, ProductRepoModule, ImageModule],
	controllers: [ReviewController],
	providers: [ReviewService],
})
export class ReviewModule {}
