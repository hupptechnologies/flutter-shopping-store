import { UploadApiResponse } from 'cloudinary';
import { Category } from 'src/module/category/entities/category.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { Review } from 'src/module/review/entities/review.entity';
import { Variant } from 'src/module/variant/entities/variant.entity';

export interface CreateBulkImage {
	images: Array<UploadApiResponse>;
	category?: Category;
	product?: Product;
	review?: Review;
	variant?: Variant;
}
