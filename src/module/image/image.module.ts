import { Module } from '@nestjs/common';
import { ImageService } from './image.service';
import { CloudinaryModule } from '../../services/cloudinary/cloudinary.module';
import { ImageRepoModule } from '../../repository/image/image-repo.module';

@Module({
	imports: [CloudinaryModule, ImageRepoModule],
	providers: [ImageService],
	exports: [ImageService],
})
export class ImageModule {}
