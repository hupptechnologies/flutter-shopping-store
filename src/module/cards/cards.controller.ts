import { Body, Controller, Post } from '@nestjs/common';
import { CardsService } from './cards.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Cards } from './entities/cards.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateCardsDto } from './dto/craete-cards.dto';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';

@Controller(URLConstant.CARDS)
export class CardsController {
	constructor(private readonly cardsService: CardsService) {}

	@Post()
	async create(
		@Body() createCardsDto: CreateCardsDto,
		@AuthUser() user: User,
	): APIResponse<Cards> {
		const card = await this.cardsService.create(createCardsDto, user);
		return {
			data: card,
			message: MessageConstant.CARD_CREATED_SUCCESS,
		};
	}
}
