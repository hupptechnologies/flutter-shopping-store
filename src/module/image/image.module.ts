import { Module } from '@nestjs/common';
import { ImageRepository } from './image.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Image } from './entities/image.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Image])],
	providers: [ImageRepository],
	exports: [ImageRepository],
})
export class ImageModule {}
