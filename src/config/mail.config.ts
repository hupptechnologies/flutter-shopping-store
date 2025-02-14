import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { MailerOptions, MailerOptionsFactory } from '@nestjs-modules/mailer';
import { join } from 'path';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';

@Injectable()
export class MailConfigService implements MailerOptionsFactory {
	constructor(private configService: ConfigService) {}

	createMailerOptions(): MailerOptions {
		return {
			transport: {
				host: this.configService.get('SMTP_HOST'),
				port: this.configService.get<number>('SMTP_PORT'),
				auth: {
					user: this.configService.get('SMTP_USER'),
					pass: this.configService.get('SMTP_PASS'),
				},
			},
			defaults: {
				from: this.configService.get('SMTP_FROM_EMAIL'),
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
