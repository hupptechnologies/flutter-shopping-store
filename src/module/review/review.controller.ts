import { Controller } from '@nestjs/common';
import { ReviewService } from './review.service';
import { URLConstant } from 'src/common/constant/url.constant';

@Controller(URLConstant.REVIEW)
export class ReviewController {
	constructor(private readonly reviewService: ReviewService) {}
}
