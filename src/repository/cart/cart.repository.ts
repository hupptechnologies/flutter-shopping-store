import { Injectable } from '@nestjs/common';
import { BaseRepository } from '../base.respository';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from 'src/module/cart/entities/cart.entity';
import { Repository } from 'typeorm';

@Loggable()
@Injectable()
export class CartRepository extends BaseRepository {
	@InjectRepository(Cart)
	private readonly repository: Repository<Cart>;
}
