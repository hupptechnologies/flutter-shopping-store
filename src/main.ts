import './common/extension/index';
import { NestFactory } from '@nestjs/core';
import * as cookieParser from 'cookie-parser';
import { INestApplication, Logger, RequestMethod } from '@nestjs/common';
import { AppModule } from './app.module';
import { ResponseInterceptor } from './interceptors/response/response.interceptor';
import { LoggingInterceptor } from './interceptors/logging/logging.interceptor';
import { useContainer } from 'class-validator';
import { DtoValidationPipe } from './pips/dto-validation/dto-validation.pipe';
import { GlobalExceptionsFilter } from './exceptions/global.exceptions.filter';
import { AppConfigService } from './config/app/app-config.service';

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

		useContainer(app.select(AppModule), {
			fallbackOnErrors: true,
		});

		app.useGlobalPipes(new DtoValidationPipe());

		app.useGlobalFilters(new GlobalExceptionsFilter());

		app.useGlobalInterceptors(new ResponseInterceptor(), new LoggingInterceptor());

		const appConfigService = app.get(AppConfigService);

		app.setGlobalPrefix(appConfigService.prefix, {
			exclude: [
				{
					path: '/',
					method: RequestMethod.GET,
				},
			],
		});
		const port = parseInt(appConfigService.port ?? 3000);

		return port;
	}
}

const application = new Application();
void application.run();
