import { Injectable, NotFoundException } from '@nestjs/common';
import { MessageConstant } from '../../common/constant/message.constant';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { ValidationException } from '../../exceptions/validation.exception';
import { CardsRepository } from '../../repository/cards/cards.repository';
import { User } from '../user/entities/user.entity';
import { CreateCardsDto } from './dto/craete-cards.dto';
import { Cards } from './entities/cards.entity';

@Injectable()
@Loggable()
export class CardsService {
	constructor(private readonly repository: CardsRepository) {}

	public async create(createCardsDto: CreateCardsDto, user: User): Promise<Cards> {
		const cards = await this.repository.findUserIdToCards(user.id);

		const isCardNumberExist = cards.some(
			(card) => card.cardNumber === createCardsDto.cardNumber,
		);

		if (isCardNumberExist) {
			throw new ValidationException({
				cardNumber: [MessageConstant.CARD_NUMBER_EXISTS],
			});
		}

		return this.repository.create(createCardsDto, user);
	}

	public async findById(id: number, userId: number): Promise<Cards> {
		const card = await this.repository.findByIdOrUserId(id, userId);

		if (!card) {
			throw new NotFoundException(MessageConstant.CARD_NOT_FOUND);
		}

		return card;
	}

	public async delete(id: number, userId: number): Promise<boolean> {
		const card = await this.repository.findByIdOrUserId(id, userId);

		if (!card) {
			throw new NotFoundException(MessageConstant.CARD_NOT_FOUND);
		}

		const isDelete = await this.repository.delete(card);
		return isDelete;
	}

	public async findAll(userId: number): Promise<Array<Cards>> {
		const cards = await this.repository.findUserIdToCards(userId);
		return cards;
	}
}
