import { Request } from '@nestjs/common';
import { Request } from 'express';
import { User } from 'src/module/user/entities/user.entity';

declare module 'express' {
	export interface Request {
		user: User;
	}
}

export { Request };
