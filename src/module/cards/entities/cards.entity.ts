import { User } from 'src/module/user/entities/user.entity';
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
export class Cards extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'int',
	})
	public number: number;

	@Column({
		type: 'int',
	})
	public cvv: number;

	@Column({
		type: 'varchar',
	})
	public name: string;

	@Column({
		type: 'varchar',
		length: 2,
	})
	public month: string;

	@Column({
		type: 'varchar',
		length: 4,
	})
	public year: string;

	@ManyToOne(() => User, (user) => user.cards, {
		onDelete: 'CASCADE',
	})
	public user: User;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
