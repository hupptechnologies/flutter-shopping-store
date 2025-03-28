import { ProductTypeEnum } from '../../../common/enum/product-type.enum';
import { Cart } from '../../cart/entities/cart.entity';
import { Category } from '../../category/entities/category.entity';
import { Image } from '../../image/entities/image.entity';
import { Review } from '../../review/entities/review.entity';
import { Variant } from '../../variant/entities/variant.entity';
import { Wishlist } from '../../wishlist/entities/wishlist.entity';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	ManyToOne,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Product extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public name: string;

	@Column({
		type: 'text',
		nullable: true,
	})
	public description: string;

	@Column({
		type: 'double',
	})
	public price: number;

	@Column({
		type: 'enum',
		enum: ProductTypeEnum,
		default: null,
		nullable: true,
	})
	public type: ProductTypeEnum;

	@ManyToOne(() => Category, (category) => category.products, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public category: Category;

	@OneToMany(() => Image, (image) => image.product, {
		eager: true,
		cascade: true,
	})
	public images: Array<Image>;

	@OneToMany(() => Review, (review) => review.product, {
		cascade: true,
	})
	public reviews: Array<Review>;

	@OneToMany(() => Variant, (variant) => variant.product, {
		cascade: true,
	})
	public variants: Array<Variant>;

	@OneToMany(() => Wishlist, (wishlist) => wishlist.product, {
		cascade: true,
	})
	public wishlist: Array<Wishlist>;

	@OneToMany(() => Cart, (cart) => cart.user, {
		cascade: true,
	})
	public carts: Array<Cart>;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
