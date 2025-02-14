import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class OtpUtils {
	generateTimeBasedOTP(length = 6): number {
		const otp = Array.from(
			{
				length,
			},
			() => Math.floor(Math.random() * 10),
		).join('');
		return Number(otp);
	}
}
