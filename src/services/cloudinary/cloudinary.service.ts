import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { v2 as cloudinary, UploadApiErrorResponse, UploadApiResponse } from 'cloudinary';

@Injectable()
export class CloudinaryService {
	constructor(private configService: ConfigService) {
		cloudinary.config({
			cloud_name: this.configService.get('CLOUDINARY_CLOUD_NAME'),
			api_key: this.configService.get('CLOUDINARY_API_KEY'),
			api_secret: this.configService.get('CLOUDINARY_API_SECRET'),
		});
	}

	public async uploadFile(file: Express.Multer.File): Promise<UploadApiResponse | null> {
		if (!file || !file.buffer) {
			return null;
		}

		return new Promise((resolve, reject) => {
			cloudinary.uploader
				.upload_stream(
					{
						resource_type: 'auto',
					},
					(error: UploadApiErrorResponse, result: UploadApiResponse) => {
						if (error) {
							return reject(new Error(error.message));
						}
						return resolve(result);
					},
				)
				.end(file.buffer);
		});
	}

	public getFileUrl(publicId: string): string {
		const url = cloudinary.url(publicId);
		return url;
	}
}
