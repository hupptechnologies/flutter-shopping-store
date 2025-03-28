import { NestFactory } from '@nestjs/core';
import { SeederService } from './seeder/seeder.service';
import { AppModule } from './app.module';

class SeederRunner {
	private async runSeeder(): Promise<void> {
		const app = await NestFactory.createApplicationContext(AppModule);
		const seeder = app.get(SeederService);

		try {
			await seeder.run();
		} catch (error) {
			console.error('Seeder error:', error);
			process.exit(1);
		} finally {
			await app.close();
		}
	}

	public async start(): Promise<void> {
		await this.runSeeder();
	}
}

void new SeederRunner().start();
