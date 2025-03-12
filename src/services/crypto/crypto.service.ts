import { Injectable } from '@nestjs/common';
import * as crypto from 'crypto';
import { AppConfigService } from 'src/config/app/app-config.service';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Injectable()
@Loggable()
export class CryptoService {
	private static readonly mode = 'aes-256-cbc';
	private static key: Buffer;

	constructor(private appConfigService: AppConfigService) {
		const cryptoKey = this.appConfigService.cryptoKey;
		CryptoService.key = Buffer.from(cryptoKey.substring(7), 'base64');
	}

	public static encrypt(text: string): string {
		const iv = crypto.randomBytes(16);
		const cipher = crypto.createCipheriv(this.mode, this.key, iv);
		let encrypted = cipher.update(text, 'utf8', 'base64');
		encrypted += cipher.final('base64');
		return `${iv.toString('base64')}:${encrypted}`;
	}

	public static decrypt(encryptedData: string): string {
		if (!encryptedData) {
			return encryptedData;
		}
		const [ivHex, encryptedText] = encryptedData.split(':');
		const iv = Buffer.from(ivHex, 'base64');
		const decipher = crypto.createDecipheriv(this.mode, this.key, iv);
		let decrypted = decipher.update(encryptedText, 'base64', 'utf8');
		decrypted += decipher.final('utf8');
		return decrypted;
	}
}
