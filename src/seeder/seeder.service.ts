import { Injectable, Logger } from '@nestjs/common';
import { ShippinMethodSeed } from '../seeder/seed/shipping-method.seed';
import { UserSeed } from './seed/user.seed';

@Injectable()
export class SeederService {
	private readonly logger: Logger = new Logger(this.constructor.name);
	constructor(
		private readonly shippinMethodSeed: ShippinMethodSeed,
		private readonly userSeed: UserSeed,
	) {}

	async run(): Promise<void> {
		try {
			this.logger.log('🚀 Seeding process started...');
			await this.userSeed.seed();
			await this.shippinMethodSeed.seed();
			this.logger.log('✅ Seeding process completed successfully.');
		} catch (error) {
			this.logger.error('❌ Seeding process failed:', error);
		}
	}
}
