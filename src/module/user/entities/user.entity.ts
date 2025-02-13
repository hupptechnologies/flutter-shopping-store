import { Exclude } from 'class-transformer';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
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

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
