import { Entity } from 'typeorm';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	ManyToOne,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';
import { Cart } from '../../cart/entities/cart.entity';
import { Product } from '../../product/entities/product.entity';
import { Image } from '../../image/entities/image.entity';

@Entity()
export class Variant extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public color: string;

	@Column()
	public size: string;

	@Column({
		type: 'double',
		nullable: true,
	})
	public price: number;

	@Column({
		type: 'int',
		default: 0,
	})
	public quantity: number;

	@ManyToOne(() => Product, (product) => product.variants, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public product: Product;

	@OneToMany(() => Image, (image) => image.variant, {
		eager: true,
		cascade: true,
	})
	public images: Array<Image>;

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
