import { Module } from '@nestjs/common';
import { MailService } from './mail.service';
import { MailerModule } from '@nestjs-modules/mailer';
import { AppConfigModule } from '../../config/app/app-config.module';
import { MailConfigService } from '../../config/mail.config';

@Module({
	imports: [
		MailerModule.forRootAsync({
			imports: [AppConfigModule],
			useClass: MailConfigService,
		}),
	],
	providers: [MailService],
	exports: [MailService],
})
export class MailModule {}
