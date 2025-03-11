import { Module } from '@nestjs/common';
import { ImageRepository } from './image.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Image } from './entities/image.entity';
import { ImageService } from './image.service';
import { CloudinaryModule } from 'src/services/cloudinary/cloudinary.module';

@Module({
	imports: [CloudinaryModule, TypeOrmModule.forFeature([Image])],
	providers: [ImageRepository, ImageService],
	exports: [ImageService],
})
export class ImageModule {}
