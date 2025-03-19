import { Product } from 'src/module/product/entities/product.entity';
import { User } from 'src/module/user/entities/user.entity';
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

@Entity()
@Unique(['user', 'product'])
export class Wishlist extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@ManyToOne(() => User, (user) => user.wishlist, {
		onDelete: 'CASCADE',
	})
	public user: User;

	@ManyToOne(() => Product, (product) => product.wishlist, {
		onDelete: 'CASCADE',
	})
	public product: Product;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
