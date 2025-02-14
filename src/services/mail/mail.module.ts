import { Module } from '@nestjs/common';
import { MailService } from './mail.service';
import { MailerModule } from '@nestjs-modules/mailer';
import { ConfigModule } from '@nestjs/config';
import { MailConfigService } from 'src/config/mail.config';

@Module({
	imports: [
		MailerModule.forRootAsync({
			imports: [ConfigModule],
			useClass: MailConfigService,
		}),
	],
	providers: [MailService],
	exports: [MailService],
})
export class MailModule {}
