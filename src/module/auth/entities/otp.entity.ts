import { User } from 'src/module/user/entities/user.entity';
import { Column, Entity, JoinColumn, OneToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Otp {
	@PrimaryColumn()
	public userId: number;

	@Column({
		type: 'int',
	})
	public otp: number;

	@Column({
		type: 'bigint',
	})
	public expiresAt: number;

	@OneToOne(() => User, (user) => user.otp, {
		onDelete: 'CASCADE',
	})
	@JoinColumn({
		name: 'userId',
	})
	public user: User;
}
