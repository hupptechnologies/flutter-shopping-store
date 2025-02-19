import { UploadApiResponse } from 'cloudinary';
import { Category } from 'src/module/category/entities/category.entity';

export interface CreateBulkImage {
	images: UploadApiResponse[];
	category?: Category;
}
