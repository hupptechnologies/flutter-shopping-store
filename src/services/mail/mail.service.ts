import { MailerService } from '@nestjs-modules/mailer';
import { Injectable, Logger } from '@nestjs/common';
import { SendMailPaylaod } from '../../common/interface/send-email.interface';
import { Loggable } from '../../decorator/loggable/loggable.decorator';
import { MailSubjectConstant } from '../../common/constant/mail-subject.constant';
import { TemplateConstant } from '../../common/constant/template.constant';

@Loggable()
@Injectable()
export class MailService {
	private readonly logger: Logger;
	constructor(private readonly mailerService: MailerService) {}

	private async send({ context, subject, to, template }: SendMailPaylaod): Promise<void> {
		try {
			await this.mailerService.sendMail({
				to,
				subject,
				template,
				context,
			});
		} catch (error) {
			this.logger.error(`Sending email error ...... ${error}`);
		}
	}

	public async sendOtp(email: string, otp: number): Promise<void> {
		await this.send({
			to: email,
			subject: MailSubjectConstant.OTP,
			template: TemplateConstant.OTP,
			context: {
				otp,
			},
		});
	}

	public async sendResetPassword(email: string, name: string): Promise<void> {
		await this.send({
			to: email,
			subject: MailSubjectConstant.RESET_PASSWORD_SUCCESS,
			template: TemplateConstant.RESET_PASSWORD_SUCCESS,
			context: {
				name,
			},
		});
	}

	public async sendRegistration(email: string, name: string): Promise<void> {
		await this.send({
			to: email,
			subject: MailSubjectConstant.REGISTRATION,
			template: TemplateConstant.REGISTRATION,
			context: {
				username: name,
			},
		});
	}
}
