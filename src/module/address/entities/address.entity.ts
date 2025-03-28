import { AddressType } from 'src/common/enum/address-type.enum';
import { Order } from 'src/module/order/entities/order.entity';
import { User } from 'src/module/user/entities/user.entity';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	Index,
	ManyToOne,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Address extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'varchar',
		length: 150,
	})
	public receiverName: string;

	@Column({
		type: 'varchar',
		length: 255,
	})
	public street: string;

	@Column({
		type: 'varchar',
		length: 100,
	})
	public city: string;

	@Column({
		type: 'varchar',
		length: 100,
	})
	public state: string;

	@Column({
		type: 'varchar',
		length: 10,
	})
	public zipCode: string;

	@Column({
		type: 'varchar',
		length: 100,
	})
	public country: string;

	@Column({
		type: 'enum',
		enum: AddressType,
		default: AddressType.HOME,
	})
	public type: AddressType;

	@Column({
		type: 'varchar',
		length: 15,
		nullable: true,
	})
	public receiverPhone?: string;

	@Column({
		type: 'boolean',
		default: true,
	})
	public isDefault: boolean;

	@Index('user_table_id')
	@ManyToOne(() => User, (user) => user.addresses, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public user?: User;

	@OneToMany(() => Order, (order) => order.shippingAddress, {
		cascade: true,
	})
	public orders: Order[];

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
