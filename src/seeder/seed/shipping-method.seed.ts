import { Repository } from 'typeorm';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { ShippingMothod } from '../../module/shipping-mothod/entities/shpping-method.entity';

@Loggable()
@Injectable()
export class ShippinMethodSeed {
	private readonly logger: Logger;
	constructor(
		@InjectRepository(ShippingMothod)
		private readonly repository: Repository<ShippingMothod>,
	) {}

	async seed(): Promise<void> {
		try {
			this.logger.log('🚀 Shipping methods seeded Starting');

			const shippingMethods = [
				{
					name: 'Free Shipping',
					cost: 0,
					estimatedDelivery: '3-7 days',
					isActive: true,
				},
				{
					name: 'Standard Shipping',
					cost: 50,
					estimatedDelivery: '3-5 days',
					isActive: true,
				},
				{
					name: 'Express Shipping',
					cost: 100,
					estimatedDelivery: '1 day',
					isActive: true,
				},
			];

			await this.repository.insert(shippingMethods);

			this.logger.log('✅ Shipping methods seeded successfully');
		} catch (error) {
			this.logger.error('❌ Shipping methods seeding failed', error);
			throw error;
		}
	}
}
