import { Module } from '@nestjs/common';
import { CardsService } from './cards.service';
import { CardsController } from './cards.controller';
import { CardsRepoModule } from '../../repository/cards/cards-repo.module';

@Module({
	imports: [CardsRepoModule],
	controllers: [CardsController],
	providers: [CardsService],
})
export class CardsModule {}
