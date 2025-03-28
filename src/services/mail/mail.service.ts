import { MailerService } from '@nestjs-modules/mailer';
import { Injectable, Logger } from '@nestjs/common';
import { SendMailPaylaod } from '../../common/interface/send-email.interface';
import { Loggable } from '../../decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class MailService {
	private readonly logger: Logger;
	constructor(private readonly mailerService: MailerService) {}

	public async send({ context, subject, to, template }: SendMailPaylaod): Promise<void> {
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
}
