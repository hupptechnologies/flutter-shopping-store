import { Injectable, Logger } from '@nestjs/common';
import { v2 as cloudinary, UploadApiErrorResponse, UploadApiResponse } from 'cloudinary';
import { CloudinaryDeleteResponse } from 'src/common/interface/cloudinary.interface';
import { AppConfigService } from 'src/config/app/app-config.service';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
@Injectable()
export class CloudinaryService {
	private readonly logger: Logger;

	constructor(private readonly appConfigService: AppConfigService) {
		cloudinary.config({
			cloud_name: this.appConfigService.cloudName,
			api_key: this.appConfigService.cloudApiKey,
			api_secret: this.appConfigService.cloudApiSecret,
		});
	}

	public async uploadFile(file: Express.Multer.File | null): Promise<UploadApiResponse | null> {
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

	public async uploadMultipleFiles(
		files: Array<Express.Multer.File>,
	): Promise<Array<UploadApiResponse>> {
		if (!files || files.length === 0) {
			return [];
		}
		const uploadPromises = files.map((file) => this.uploadFile(file));
		const results = await Promise.all(uploadPromises);
		return results.filter((result) => result !== null);
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

	public static deleteItem(publicId: string): void {
		try {
			void cloudinary.uploader.destroy(publicId);
		} catch (error) {
			console.error('Cloudinary Deletion Error:', error);
		}
	}
}
