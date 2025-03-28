import { Exclude } from 'class-transformer';
import { Gender } from '../../../common/enum/gender.enum';
import { Address } from '../../address/entities/address.entity';
import { Otp } from '../../auth/entities/otp.entity';
import { Cards } from '../../cards/entities/cards.entity';
import { Cart } from '../../cart/entities/cart.entity';
import { Order } from '../../order/entities/order.entity';
import { Review } from '../../review/entities/review.entity';
import { Wishlist } from '../../wishlist/entities/wishlist.entity';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	OneToMany,
	OneToOne,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class User extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'varchar',
		length: 255,
	})
	public firstName: string;

	@Column({
		type: 'varchar',
		length: 255,
	})
	public lastName: string;

	@Column({
		type: 'varchar',
		length: 255,
		unique: true,
	})
	public email: string;

	@Exclude()
	@Column({
		type: 'varchar',
	})
	public password: string;

	@Column({
		type: 'varchar',
		length: 15,
		nullable: true,
		default: null,
	})
	public mobileNumber?: string;

	@Column({
		type: 'varchar',
		nullable: true,
		default: null,
	})
	public image?: string | null;

	@Column({
		type: 'enum',
		enum: Gender,
		nullable: true,
		default: null,
	})
	public gender?: Gender;

	@OneToMany(() => Address, (address) => address.user, {
		cascade: true,
	})
	public addresses: Array<Address>;

	@OneToOne(() => Otp, (otp) => otp.user, {
		cascade: true,
	})
	public otp: Otp;

	@OneToMany(() => Cards, (cards) => cards.user, {
		cascade: true,
	})
	public cards: Array<Cards>;

	@OneToMany(() => Review, (review) => review.user, {
		cascade: true,
	})
	public reviews: Array<Review>;

	@OneToMany(() => Wishlist, (wishlist) => wishlist.user, {
		cascade: true,
	})
	public wishlist: Array<Wishlist>;

	@OneToMany(() => Cart, (cart) => cart.user, {
		cascade: true,
	})
	public carts: Array<Cart>;

	@OneToMany(() => Order, (order) => order.user, {
		cascade: true,
	})
	public orders: Array<Order>;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;

	public get fullname(): string {
		return `${this.firstName} ${this.lastName}`;
	}
}
