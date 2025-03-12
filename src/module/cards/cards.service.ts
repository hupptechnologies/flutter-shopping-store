import { Injectable, NotFoundException } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { CardsRepository } from './cards.repository';
import { CreateCardsDto } from './dto/craete-cards.dto';
import { User } from '../user/entities/user.entity';
import { Cards } from './entities/cards.entity';
import { ValidationException } from 'src/exceptions/validation.exception';
import { MessageConstant } from 'src/common/constant/message.constant';

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
}
