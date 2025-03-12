import { Module } from '@nestjs/common';
import { CardsService } from './cards.service';
import { CardsController } from './cards.controller';
import { CardsRepository } from './cards.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cards } from './entities/cards.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Cards])],
	controllers: [CardsController],
	providers: [CardsService, CardsRepository],
})
export class CardsModule {}
