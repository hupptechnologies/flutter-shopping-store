import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Review } from 'src/module/review/entities/review.entity';
import { ReviewRepository } from 'src/repository/review/review.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Review])],
	providers: [ReviewRepository],
	exports: [ReviewRepository],
})
export class ReviewRepoModule {}
