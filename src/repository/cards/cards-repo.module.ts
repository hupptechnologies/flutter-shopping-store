import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cards } from '../../module/cards/entities/cards.entity';
import { CardsRepository } from './cards.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Cards])],
	providers: [CardsRepository],
	exports: [CardsRepository],
})
export class CardsRepoModule {}
