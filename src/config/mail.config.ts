import { Injectable } from '@nestjs/common';
import { MailerOptions, MailerOptionsFactory } from '@nestjs-modules/mailer';
import { join } from 'path';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { AppConfigService } from './app/app-config.service';

@Injectable()
export class MailConfigService implements MailerOptionsFactory {
	constructor(private appConfigService: AppConfigService) {}

	createMailerOptions(): MailerOptions {
		return {
			transport: {
				host: this.appConfigService.smtpHost,
				port: +this.appConfigService.smtpPort,
				auth: {
					user: this.appConfigService.smtpUser,
					pass: this.appConfigService.smtpPass,
				},
			},
			defaults: {
				from: this.appConfigService.smtpFromEmail,
			},
			template: {
				dir: join(__dirname, '..', '..', 'src', 'templates'),
				adapter: new HandlebarsAdapter(),
				options: {
					strict: true,
				},
			},
		};
	}
}
