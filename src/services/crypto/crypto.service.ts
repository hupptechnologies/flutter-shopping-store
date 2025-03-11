import { Injectable, Logger } from '@nestjs/common';
import * as crypto from 'crypto';
import { AppConfigService } from 'src/config/app/app-config.service';

@Injectable()
export class CryptoService {
	private readonly logger: Logger;
	private static readonly sha = 'sha256';
	private static readonly mode = 'aes-256-cbc';
	private static key: Buffer;

	constructor(private appConfigService: AppConfigService) {
		const cryptoKey = this.appConfigService.cryptoKey;
		CryptoService.key = Buffer.from(cryptoKey, 'utf-8');
	}

	public static encrypt(text: string): string {
		const iv = crypto.randomBytes(16);
		const cipher = crypto.createCipheriv(this.mode, this.key, iv);
		let encrypted = cipher.update(text, 'utf8', 'hex');
		encrypted += cipher.final('hex');
		return `${iv.toString('hex')}:${encrypted}`;
	}

	public static decrypt(encryptedData: string): string {
		if (!encryptedData) {
			return encryptedData;
		}
		const [ivHex, encryptedText] = encryptedData.split(':');
		const iv = Buffer.from(ivHex, 'hex');
		const decipher = crypto.createDecipheriv(this.mode, this.key, iv);
		let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
		decrypted += decipher.final('utf8');
		return decrypted;
	}
}
