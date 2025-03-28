import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CartRepository } from './cart.repository';
import { Cart } from '../../module/cart/entities/cart.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Cart])],
	providers: [CartRepository],
	exports: [CartRepository],
})
export class CartRepoModule {}
