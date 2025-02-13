import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { v2 as cloudinary, UploadApiErrorResponse, UploadApiResponse } from 'cloudinary';
import { CloudinaryDeleteResponse } from 'src/common/interface/cloudinary.interface';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class CloudinaryService {
	private readonly logger: Logger;

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

	public async delete(publicId: string): Promise<boolean> {
		try {
			const result = (await cloudinary.uploader.destroy(
				publicId,
			)) as CloudinaryDeleteResponse;

			return result.result === 'ok';
		} catch (error) {
			this.logger.error(
				'Cloudinary Deletion Error:',
				(error as UploadApiErrorResponse).message,
			);
			return false;
		}
	}
}
