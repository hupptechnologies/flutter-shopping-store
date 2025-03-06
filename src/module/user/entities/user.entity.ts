import { Exclude } from 'class-transformer';
import { Gender } from 'src/common/enum/gender.enum';
import { Address } from 'src/module/address/entities/address.entity';
import { Otp } from 'src/module/auth/entities/otp.entity';
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
	public addresses: Address[];

	@OneToOne(() => Otp, (otp) => otp.user, {
		cascade: true,
	})
	public otp: Otp;

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
