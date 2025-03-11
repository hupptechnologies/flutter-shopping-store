import { Injectable } from '@nestjs/common';
import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import * as path from 'path';
import { AppConfigService } from './app/app-config.service';

@Injectable()
export class DatabaseConfig {
	constructor(private appConfig: AppConfigService) {}

	public createTypeOrmOptions(): TypeOrmModuleOptions {
		return {
			type: 'mysql',
			host: this.appConfig.mysqlHost,
			port: +this.appConfig.mysqlPort,
			username: this.appConfig.mysqlUser,
			password: this.appConfig.mysqlPassword,
			database: this.appConfig.mysqlDatabase,
			entities: [path.resolve(__dirname, '../module/**/entities/**.entity{.ts,.js}')],
			synchronize: true,
			timezone: '+05:30',
		};
	}
}
