export interface BrandsWishlist {
	category: {
		id: number;
		name: number;
	};
	product: Array<{
		id: number;
		name: string;
		price: number;
		images: Array<{
			id: number;
			url: string;
		}>;
	}>;
}
