import { Module } from '@nestjs/common';
import { ImageRepository } from './image.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Image } from './entities/image.entity';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { ImageService } from './image.service';

@Module({
	imports: [TypeOrmModule.forFeature([Image])],
	providers: [ImageRepository, ImageService, CloudinaryService],
	exports: [ImageService],
})
export class ImageModule {}
