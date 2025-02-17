import { User } from 'src/module/user/entities/user.entity';
import { BaseEntity, Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Otp extends BaseEntity {
	@PrimaryColumn()
	public userId: number;

	@Column({
		type: 'int',
		nullable: true,
	})
	public otp: number | null;

	@Column({
		type: 'bigint',
	})
	public expiresAt: number;

	@Column({
		type: 'boolean',
		default: false,
	})
	public isVerify: boolean;

	@OneToOne(() => User, (user) => user.otp, {
		onDelete: 'CASCADE',
	})
	@JoinColumn({
		name: 'userId',
	})
	public user: User;
}
