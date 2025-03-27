import { Exclude } from 'class-transformer';
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
	public cardholderName: string;

	@Exclude({
		toPlainOnly: true,
	})
	@Column({
		type: 'varchar',
		length: 255,
	})
	public encryptedNumber: string;

	@Exclude({
		toPlainOnly: true,
	})
	@Column({
		type: 'varchar',
		length: 255,
	})
	public encryptedCvv: string;

	@Column({
		type: 'varchar',
		length: 7,
	})
	public expirationDate: string;

	@Column({
		type: 'enum',
		enum: CardTypeEnum,
	})
	public type: CardTypeEnum;

	@ManyToOne(() => User, (user) => user.cards, {
		onDelete: 'CASCADE',
		nullable: false,
	})
	public user: User;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;

	public cardNumber: string;
	public cvv: string;

	@BeforeInsert()
	@BeforeUpdate()
	encryptCardDetails(): void {
		this.encryptedNumber = CryptoService.encrypt(this.cardNumber);
		this.encryptedCvv = CryptoService.encrypt(this.cvv);
	}

	@AfterLoad()
	decryptCardDetails(): void {
		this.cardNumber = CryptoService.decrypt(this.encryptedNumber);
		this.cvv = CryptoService.decrypt(this.encryptedCvv);
	}
}
