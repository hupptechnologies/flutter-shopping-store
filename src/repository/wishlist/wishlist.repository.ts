import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Wishlist } from 'src/module/wishlist/entities/wishlist.entity';

@Loggable()
@Injectable()
export class WishListRepository {
	private readonly name: string = Wishlist.name.toLowerCase();

	constructor(
		@InjectRepository(Wishlist)
		private readonly repository: Repository<Wishlist>,
	) {}
}
