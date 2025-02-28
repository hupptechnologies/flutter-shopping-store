import { UploadApiResponse } from 'cloudinary';
import { Category } from 'src/module/category/entities/category.entity';
import { Product } from 'src/module/product/entities/product.entity';

export interface CreateBulkImage {
	images: UploadApiResponse[];
	category?: Category;
	product?: Product;
}
