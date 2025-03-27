import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cart } from 'src/module/cart/entities/cart.entity';
import { CartRepository } from './cart.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Cart])],
	providers: [CartRepository],
	exports: [CartRepository],
})
export class CartRepoModule {}
