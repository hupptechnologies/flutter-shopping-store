import { Module } from '@nestjs/common';
import { AppConfigModule } from 'src/config/app/app-config.module';
import { CloudinaryService } from './cloudinary.service';

@Module({
	imports: [AppConfigModule],
	providers: [CloudinaryService],
	exports: [CloudinaryService],
})
export class CloudinaryModule {}
