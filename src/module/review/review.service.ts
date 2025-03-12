import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { ReviewRepository } from './review.repository';

@Injectable()
@Loggable()
export class ReviewService {
	constructor(private readonly repository: ReviewRepository) {}
}
