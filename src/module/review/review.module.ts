import { Module } from '@nestjs/common';
import { ReviewService } from './review.service';
import { ReviewController } from './review.controller';
import { ReviewRepository } from './review.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Review } from './entities/review.entity';
import { ProductModule } from '../product/product.module';
import { ImageModule } from '../image/image.module';

@Module({
	imports: [TypeOrmModule.forFeature([Review]), ProductModule, ImageModule],
	controllers: [ReviewController],
	providers: [ReviewService, ReviewRepository],
})
export class ReviewModule {}
