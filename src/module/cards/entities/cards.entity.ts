import { CardTypeEnum } from 'src/common/enum/card-type.enum';
import { User } from 'src/module/user/entities/user.entity';
import { CryptoService } from 'src/services/crypto/crypto.service';
import {
	AfterLoad,
	BaseEntity,
	BeforeInsert,
	BeforeUpdate,
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
		type: 'varchar',
	})
	public name: string;

	@Column({
		type: 'varchar',
		length: 255,
	})
	private encryptedNumber: string;

	@Column({
		type: 'varchar',
		length: 255,
	})
	private encryptedCvv: string;

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

	@Column({
		type: 'enum',
		enum: CardTypeEnum,
	})
	public type: CardTypeEnum;

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

	public number: string;
	public cvv: string;

	@BeforeInsert()
	@BeforeUpdate()
	encryptCardDetails(): void {
		if (this.number) {
			this.encryptedNumber = CryptoService.encrypt(this.number);
		}
		if (this.cvv) {
			this.encryptedCvv = CryptoService.encrypt(this.cvv);
		}
	}

	@AfterLoad()
	decryptCardDetails(): void {
		if (this.encryptedNumber) {
			this.number = CryptoService.decrypt(this.encryptedNumber);
		}
		if (this.encryptedCvv) {
			this.cvv = CryptoService.decrypt(this.encryptedCvv);
		}
	}
}
