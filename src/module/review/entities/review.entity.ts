import { Image } from '../../image/entities/image.entity';
import { Product } from '../../product/entities/product.entity';
import { User } from '../../user/entities/user.entity';
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
export class Review extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'text',
	})
	public comment: string;

	@Column({
		type: 'decimal',
		precision: 2,
		scale: 1,
		default: 0,
	})
	public rating: number;

	@OneToMany(() => Image, (image) => image.review, {
		eager: true,
		cascade: true,
	})
	public images: Array<Image>;

	@ManyToOne(() => Product, (product) => product.reviews, {
		onDelete: 'CASCADE',
	})
	public product: Product;

	@ManyToOne(() => User, (user) => user.reviews, {
		onDelete: 'CASCADE',
		eager: true,
		nullable: false,
	})
	public user: User;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
