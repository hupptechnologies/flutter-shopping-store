import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Review } from '../../module/review/entities/review.entity';
import { ReviewRepository } from './review.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Review])],
	providers: [ReviewRepository],
	exports: [ReviewRepository],
})
export class ReviewRepoModule {}
