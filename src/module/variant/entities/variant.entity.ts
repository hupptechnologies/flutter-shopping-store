import { Image } from 'src/module/image/entities/image.entity';
import { Product } from 'src/module/product/entities/product.entity';
import { Entity } from 'typeorm';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	ManyToOne,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Variant extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public color: string;

	@Column()
	public size: string;

	@Column({
		type: 'double',
		nullable: true,
	})
	public price: number;

	@Column({
		type: 'int',
		default: 0,
	})
	public stock: number;

	@ManyToOne(() => Product, (product) => product.variants, {
		onDelete: 'CASCADE',
	})
	public product: Product;

	@OneToMany(() => Image, (image) => image.variant, {
		eager: true,
		cascade: true,
	})
	public images: Array<Image>;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
