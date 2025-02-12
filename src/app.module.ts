import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseConfig } from './config/database.config';
import { UserModule } from './module/user/user.module';
import { BcryptService } from './services/bcrypt/bcrypt.service';

@Module({
	imports: [
		ConfigModule.forRoot({
			isGlobal: true,
		}),
		TypeOrmModule.forRootAsync({
			imports: [ConfigModule],
			useClass: DatabaseConfig,
		}),
		UserModule,
	],
	controllers: [AppController],
	providers: [AppService, BcryptService],
})
export class AppModule {}
