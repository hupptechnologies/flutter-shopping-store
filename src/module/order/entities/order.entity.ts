import { OrderType } from '../../../common/enum/order-type.enum';
import { Address } from '../../address/entities/address.entity';
import { Cart } from '../../cart/entities/cart.entity';
import { ShippingMothod } from '../../shipping-mothod/entities/shpping-method.entity';
import { User } from '../../user/entities/user.entity';
import { Voucher } from '../../voucher/entities/voucher.entity';
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
export class Order extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@ManyToOne(() => User, (user) => user.orders, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public user: User;

	@OneToMany(() => Cart, (cart) => cart.order, {
		cascade: true,
	})
	public carts: Cart[];

	@ManyToOne(() => Address, (address) => address.orders, {
		onDelete: 'SET NULL',
		nullable: true,
	})
	public shippingAddress: Address | null;

	@ManyToOne(() => Voucher, (voucher) => voucher, {
		onDelete: 'SET NULL',
		nullable: true,
	})
	public voucher: Voucher | null;

	@ManyToOne(() => ShippingMothod, (shippingMethod) => shippingMethod.orders, {
		onDelete: 'SET NULL',
		nullable: true,
	})
	public shippingMethod: ShippingMothod | null;

	@Column({
		type: 'double',
		default: 0,
	})
	public productTotal: number;

	@Column({
		type: 'double',
		default: 0,
	})
	public shippingCost: number;

	@Column({
		type: 'double',
		default: 0,
	})
	public totalAmount: number;

	@Column({
		type: 'enum',
		enum: OrderType,
		default: OrderType.PENDING,
	})
	public status: OrderType;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
