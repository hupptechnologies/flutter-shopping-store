import { Body, Controller, Delete, Get, Param, ParseIntPipe, Post } from '@nestjs/common';
import { CardsService } from './cards.service';
import { URLConstant } from 'src/common/constant/url.constant';
import { APIResponse } from 'src/common/types/api-response.type';
import { Cards } from './entities/cards.entity';
import { MessageConstant } from 'src/common/constant/message.constant';
import { CreateCardsDto } from './dto/craete-cards.dto';
import { AuthUser } from 'src/decorator/auth-user/auth-user.decorator';
import { User } from '../user/entities/user.entity';
import { KeyConstant } from 'src/common/constant/key.constant';
import { AuthUserId } from 'src/decorator/auth-user-id/auth-user-id.decorator';

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

	@Get(URLConstant.ROUTER_ID)
	async findById(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@AuthUserId() userId: number,
	): APIResponse<Cards> {
		const card = await this.cardsService.findById(id, userId);
		return {
			data: card,
			message: MessageConstant.Card_FOUND_SUCCESS,
		};
	}

	@Delete(URLConstant.ROUTER_ID)
	async delete(
		@Param(KeyConstant.ID, ParseIntPipe) id: number,
		@AuthUserId() userId: number,
	): APIResponse<boolean> {
		const isDelete = await this.cardsService.delete(id, userId);
		return {
			data: isDelete,
			message: MessageConstant.CARD_DELETED_SUCCESS,
		};
	}
}
