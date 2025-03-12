import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { Repository } from 'typeorm';
import { Cards } from './entities/cards.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateCardsDto } from './dto/craete-cards.dto';
import { User } from '../user/entities/user.entity';

@Loggable()
@Injectable()
export class CardsRepository {
	constructor(
		@InjectRepository(Cards)
		private readonly repository: Repository<Cards>,
	) {}

	public async create(createCardsDto: CreateCardsDto, user: User): Promise<Cards> {
		const category = this.repository.create(createCardsDto);
		category.cardNumber = createCardsDto.cardNumber;
		category.cvv = createCardsDto.cvv;
		category.user = user;
		return this.repository.save(category);
	}

	public async findUserIdToCards(userId: number): Promise<Array<Cards>> {
		return this.repository.find({
			where: {
				user: {
					id: userId,
				},
			},
		});
	}

	public async findByIdOrUserId(id: number, userId: number): Promise<Cards | null> {
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
