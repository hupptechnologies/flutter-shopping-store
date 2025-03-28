import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Review } from '../../module/review/entities/review.entity';
import { Repository } from 'typeorm';
import { CreateReviewDto } from '../../module/review/dto/create-review.dto';
import { User } from '../../module/user/entities/user.entity';
import { BaseRepository } from '../base.respository';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Injectable()
@Loggable()
export class ReviewRepository extends BaseRepository {
	constructor(
		@InjectRepository(Review)
		private readonly repository: Repository<Review>,
	) {
		super();
	}

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
}
