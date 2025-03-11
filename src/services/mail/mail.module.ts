import { Module } from '@nestjs/common';
import { MailService } from './mail.service';
import { MailerModule } from '@nestjs-modules/mailer';
import { MailConfigService } from 'src/config/mail.config';
import { AppConfigModule } from 'src/config/app/app-config.module';

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
