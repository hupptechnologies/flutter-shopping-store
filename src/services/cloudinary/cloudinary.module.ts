import { Module } from '@nestjs/common';
import { CloudinaryService } from './cloudinary.service';
import { AppConfigModule } from '../../config/app/app-config.module';

@Module({
	imports: [AppConfigModule],
	providers: [CloudinaryService],
	exports: [CloudinaryService],
})
export class CloudinaryModule {}
