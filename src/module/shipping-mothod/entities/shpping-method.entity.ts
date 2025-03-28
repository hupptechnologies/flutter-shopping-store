import { Order } from '../../order/entities/order.entity';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class ShippingMothod extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'varchar',
		length: 100,
		unique: true,
		nullable: false,
	})
	public name: string;

	@Column({
		type: 'double',
		nullable: false,
		default: 0,
	})
	public cost: number;

	@Column({
		type: 'varchar',
		length: 50,
		nullable: false,
	})
	public estimatedDelivery: string;

	@Column({
		type: 'boolean',
		default: true,
	})
	public isActive: boolean;

	@OneToMany(() => Order, (order) => order.shippingMethod)
	public orders: Order[];

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
