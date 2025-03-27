import { Product } from 'src/module/product/entities/product.entity';

export interface DashboardList {
	featuredProducts: Array<Product>;
	recommendedProducts: Array<Product>;
	topCollections: Array<Product>;
}
