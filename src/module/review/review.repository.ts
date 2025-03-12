import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Review } from './entities/review.entity';
import { Repository } from 'typeorm';

@Injectable()
@Loggable()
export class ReviewRepository {
	constructor(
		@InjectRepository(Review)
		private readonly repository: Repository<Review>,
	) {}
}
