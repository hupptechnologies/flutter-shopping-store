import { UploadApiResponse } from 'cloudinary';
import { Category } from '../../module/category/entities/category.entity';
import { Product } from '../../module/product/entities/product.entity';
import { Review } from '../../module/review/entities/review.entity';
import { Variant } from '../../module/variant/entities/variant.entity';

export interface CreateBulkImage {
	images: Array<UploadApiResponse>;
	category?: Category;
	product?: Product;
	review?: Review;
	variant?: Variant;
}
