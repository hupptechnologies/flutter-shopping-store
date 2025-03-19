import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CardsRepository } from 'src/repository/cards/cards.repository';
import { Cards } from 'src/module/cards/entities/cards.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Cards])],
	providers: [CardsRepository],
	exports: [CardsRepository],
})
export class CardsRepoModule {}
