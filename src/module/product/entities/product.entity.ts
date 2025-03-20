import { Gender } from 'src/common/enum/gender.enum';
import { Category } from 'src/module/category/entities/category.entity';
import { Image } from 'src/module/image/entities/image.entity';
import { Review } from 'src/module/review/entities/review.entity';
import { Variant } from 'src/module/variant/entities/variant.entity';
import { Wishlist } from 'src/module/wishlist/entities/wishlist.entity';
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
		enum: Gender,
		default: null,
		nullable: true,
	})
	public gender: Gender;

	@ManyToOne(() => Category, (category) => category.products, {
		onDelete: 'CASCADE',
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

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
