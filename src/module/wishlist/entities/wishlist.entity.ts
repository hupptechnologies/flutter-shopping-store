import {
	BaseEntity,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	ManyToOne,
	PrimaryGeneratedColumn,
	Unique,
	UpdateDateColumn,
} from 'typeorm';
import { Product } from '../../product/entities/product.entity';
import { User } from '../../user/entities/user.entity';

@Entity()
@Unique(['user', 'product'])
export class Wishlist extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@ManyToOne(() => User, (user) => user.wishlist, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public user: User;

	@ManyToOne(() => Product, (product) => product.wishlist, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public product: Product;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
