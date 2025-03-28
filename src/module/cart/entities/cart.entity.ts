import { Order } from 'src/module/order/entities/order.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { User } from 'src/module/user/entities/user.entity';
import { Variant } from 'src/module/variant/entities/variant.entity';
import {
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
export class Cart extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@ManyToOne(() => User, (user) => user.carts, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public user: User;

	@ManyToOne(() => Product, (product) => product.carts, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public product: Product;

	@ManyToOne(() => Variant, (variant) => variant.carts, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public variant: Variant;

	@ManyToOne(() => Order, (order) => order.carts, {
		onDelete: 'SET NULL',
		nullable: true,
	})
	public order: Order | null;

	@Column({
		type: 'int',
		default: 1,
	})
	public quantity: number;

	@Column({
		type: 'double',
	})
	public price: number;

	@Column({
		type: 'boolean',
		default: false,
	})
	public isSelected: boolean;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
