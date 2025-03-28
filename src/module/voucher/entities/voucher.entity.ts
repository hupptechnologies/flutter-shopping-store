import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	Index,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';
import { DiscountEnum } from '../../../common/enum/discount.enum';

@Entity()
export class Voucher extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public name: string;

	@Column({
		type: 'boolean',
		default: false,
	})
	public firstOrder: boolean;

	@Index('code')
	@Column({
		unique: true,
	})
	public code: string;

	@Column({
		type: 'enum',
		enum: DiscountEnum,
	})
	public discountType: DiscountEnum;

	@Column('decimal', {
		precision: 10,
		scale: 2,
	})
	public discountValue: number;

	@Column('decimal', {
		precision: 10,
		scale: 2,
		nullable: true,
	})
	public minOrderValue: number;

	@Column('decimal', {
		precision: 10,
		scale: 2,
		nullable: true,
	})
	public maxDiscount: number;

	@Column({
		type: 'timestamp',
		nullable: true,
		default: () => 'CURRENT_TIMESTAMP',
	})
	public validFrom: Date;

	@Column({
		type: 'timestamp',
	})
	public validTo: Date;

	@Column({
		type: 'int',
		default: 1,
	})
	public usageLimit: number;

	@Column({
		type: 'int',
		default: 0,
	})
	public usedCount: number;

	@Column({
		type: 'boolean',
		default: false,
	})
	public userSpecific: boolean;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
