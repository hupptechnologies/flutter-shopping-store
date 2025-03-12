import { Exclude } from 'class-transformer';
import { Category } from 'src/module/category/entities/category.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { Review } from 'src/module/review/entities/review.entity';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import {
	AfterRemove,
	AfterSoftRemove,
	BaseEntity,
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

	@CreateDateColumn()
	public createdAt: Date;

	@Exclude()
	@UpdateDateColumn()
	public updatedAt: Date;

	@Exclude()
	@DeleteDateColumn()
	public deletedAt: Date | null;

	@AfterRemove()
	@AfterSoftRemove()
	afterSoftRemove(): void {
		CloudinaryService.deleteItem(this.public_id);
	}
}
