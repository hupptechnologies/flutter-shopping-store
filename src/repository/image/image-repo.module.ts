import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Image } from 'src/module/image/entities/image.entity';
import { ImageRepository } from 'src/repository/image/image.repository';

@Module({
	imports: [TypeOrmModule.forFeature([Image])],
	providers: [ImageRepository],
	exports: [ImageRepository],
})
export class ImageRepoModule {}
