import { Module } from '@nestjs/common';
import { ReviewService } from './review.service';
import { ReviewController } from './review.controller';
import { ReviewRepository } from './review.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Review } from './entities/review.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Review])],
	controllers: [ReviewController],
	providers: [ReviewService, ReviewRepository],
})
export class ReviewModule {}
