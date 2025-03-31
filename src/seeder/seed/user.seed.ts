import { Injectable, Logger } from '@nestjs/common';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { UserService } from '../../module/user/user.service';
import { CreateUserDto } from '../../module/user/dto/create-user.dto';
import { AppConfigService } from '../../config/app/app-config.service';
import { AppConfigException } from '../../exceptions/app-config.exception';

@Loggable()
@Injectable()
export class UserSeed {
	private readonly logger: Logger;

	constructor(
		private readonly userService: UserService,
		private readonly config: AppConfigService,
	) {}

	async seed(): Promise<void> {
		try {
			this.logger.log('🚀 User seeded Starting');

			const adminUser: CreateUserDto = {
				firstName: this.config.adminUserFirstName,
				lastName: this.config.adminUserLastName,
				email: this.config.adminUserEmail,
				password: this.config.adminUserPassword,
			};

			await this.userService.create(adminUser, null);
			this.logger.log('✅ User seeded successfully');
		} catch (error) {
			this.logger.error('❌ User seeding failed', error);
			if (error instanceof AppConfigException) {
				process.exit(1);
			}
		}
	}
}
