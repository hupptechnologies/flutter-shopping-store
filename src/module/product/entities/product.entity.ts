import { Category } from 'src/module/category/entities/category.entity';
import { Image } from 'src/module/image/entities/image.entity';
import { Review } from 'src/module/review/entities/review.entity';
import { Variant } from 'src/module/variant/entities/variant.entity';
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

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
