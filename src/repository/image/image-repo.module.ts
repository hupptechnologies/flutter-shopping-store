import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ImageRepository } from './image.repository';
import { Image } from '../../module/image/entities/image.entity';

@Module({
	imports: [TypeOrmModule.forFeature([Image])],
	providers: [ImageRepository],
	exports: [ImageRepository],
})
export class ImageRepoModule {}
