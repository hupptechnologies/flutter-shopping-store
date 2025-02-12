import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import * as path from 'path';

@Injectable()
export class DatabaseConfig {
	constructor(private configService: ConfigService) {}

	public createTypeOrmOptions(): TypeOrmModuleOptions {
		return {
			type: 'mysql',
			host: this.configService.get<string>('MYSQL_DB_HOST'),
			port: +this.configService.get('MYSQL_DB_PORT'),
			username: this.configService.get<string>('MYSQL_DB_USERNAME'),
			password: this.configService.get<string>('MYSQL_DB_PASSWORD'),
			database: this.configService.get<string>('MYSQL_DB_DATABASE'),
			entities: [path.resolve(__dirname, '../module/**/entities/**.entity{.ts,.js}')],
			synchronize: true,
			timezone: '+05:30',
		};
	}
}
