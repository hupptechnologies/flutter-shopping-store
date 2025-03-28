import { Exclude } from 'class-transformer';
import { Category } from '../../category/entities/category.entity';
import { Product } from '../../product/entities/product.entity';
import { Review } from '../../review/entities/review.entity';
import { Variant } from '../../variant/entities/variant.entity';
import { CloudinaryService } from '../../../services/cloudinary/cloudinary.service';
import {
	AfterRemove,
	AfterSoftRemove,
	BaseEntity,
	BeforeInsert,
	BeforeUpdate,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	ManyToOne,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Image extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public url: string;

	@Exclude()
	@Column()
	public public_id: string;

	@Exclude()
	@ManyToOne(() => Category, (category) => category.images, {
		onDelete: 'CASCADE',
		nullable: true,
	})
	public category: Category;

	@Exclude()
	@ManyToOne(() => Product, (product) => product.images, {
		onDelete: 'CASCADE',
		nullable: true,
	})
	public product: Product;

	@Exclude()
	@ManyToOne(() => Review, (review) => review.images, {
		onDelete: 'CASCADE',
		nullable: true,
	})
	public review: Review;

	@Exclude()
	@ManyToOne(() => Variant, (variant) => variant.images, {
		onDelete: 'CASCADE',
		nullable: true,
	})
	public variant: Variant;

	@CreateDateColumn()
	public createdAt: Date;

	@Exclude()
	@UpdateDateColumn()
	public updatedAt: Date;

	@Exclude()
	@DeleteDateColumn()
	public deletedAt: Date | null;

	@BeforeInsert()
	@BeforeUpdate()
	validateAssociation(): void {
		if (!this.category && !this.product && !this.review && !this.variant) {
			throw new Error(
				'An image must be associated with at least one entity: category, product, review, or variant.',
			);
		}
	}

	@AfterRemove()
	@AfterSoftRemove()
	afterSoftRemove(): void {
		CloudinaryService.deleteItem(this.public_id);
	}
}
