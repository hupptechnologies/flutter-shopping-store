import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Review } from './entities/review.entity';
import { Repository } from 'typeorm';
import { CreateReviewDto } from './dto/create-review.dto';
import { User } from '../user/entities/user.entity';

@Injectable()
@Loggable()
export class ReviewRepository {
	constructor(
		@InjectRepository(Review)
		private readonly repository: Repository<Review>,
	) {}

	public async create(dto: CreateReviewDto, user: User): Promise<Review> {
		const create = this.repository.create(dto);
		create.user = user;
		return this.repository.save(create);
	}

	public async findByIdAndUserId(id: number, userId: number): Promise<Review | null> {
		return this.repository.findOne({
			where: {
				id,
				user: {
					id: userId,
				},
			},
		});
	}

	public async delete(review: Review, isSoftDetele = true): Promise<boolean> {
		if (isSoftDetele) {
			const reviewDelete = await review.softRemove();
			return !!reviewDelete;
		}
		const reviewDelete = await review.remove();
		return !!reviewDelete;
	}
}
