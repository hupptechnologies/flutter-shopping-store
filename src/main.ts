import { NestFactory } from '@nestjs/core';
import * as cookieParser from 'cookie-parser';
import { INestApplication, Logger, RequestMethod } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { AppModule } from './app.module';
import { ResponseInterceptor } from './interceptors/response/response.interceptor';
import { LoggingInterceptor } from './interceptors/logging/logging.interceptor';

class Application {
	private readonly logger = new Logger(Application.name);

	public async run(): Promise<void> {
		try {
			const app: INestApplication<AppModule> = await NestFactory.create(AppModule);

			const port = this.configureApp(app);
			await app.listen(port);

			this.logger.log(`Application is running on: http://localhost:${port}`);
		} catch (error) {
			this.logger.error('Error during application bootstrap:', error);
			process.exit(1);
		}
	}

	private configureApp(app: INestApplication<AppModule>): number {
		app.use(cookieParser());

		app.useGlobalInterceptors(new ResponseInterceptor(), new LoggingInterceptor());

		const configService = app.get(ConfigService);

		const prefix = configService.get<string>('PREFIX') ?? '';

		app.setGlobalPrefix(prefix, {
			exclude: [
				{
					path: '/',
					method: RequestMethod.GET,
				},
			],
		});
		const port = configService.get<number>('PORT') ?? 3000;

		return port;
	}
}

const application = new Application();
void application.run();
