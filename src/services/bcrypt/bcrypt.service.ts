import * as bcrypt from 'bcrypt';
import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class BcryptService {
	private readonly saltRounds = 10;

	async hashPassword(password: string): Promise<string> {
		const salt = await bcrypt.genSalt(this.saltRounds);
		return bcrypt.hash(password, salt);
	}

	async comparePassword(password: string, hashPassword: string): Promise<boolean> {
		return await bcrypt.compare(password, hashPassword);
	}
}
