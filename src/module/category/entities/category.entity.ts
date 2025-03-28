import { Gender } from '../../../common/enum/gender.enum';
import { Image } from '../../image/entities/image.entity';
import { Product } from '../../product/entities/product.entity';
import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	OneToMany,
	PrimaryGeneratedColumn,
	Tree,
	TreeChildren,
	TreeParent,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
@Tree('materialized-path')
export class Category extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column({
		type: 'varchar',
	})
	public name: string;

	@Column({
		type: 'text',
		nullable: true,
	})
	public description: string;

	@Column({
		type: 'enum',
		enum: Gender,
		default: null,
		nullable: true,
	})
	public gender: Gender;

	@Column({
		type: 'varchar',
		nullable: true,
	})
	public color: string;

	@TreeParent({
		onDelete: 'CASCADE',
	})
	public parent: Category;

	@TreeChildren({
		cascade: true,
	})
	public children: Array<Category>;

	@OneToMany(() => Image, (image) => image.category, {
		eager: true,
		cascade: true,
	})
	public images: Array<Image>;

	@OneToMany(() => Product, (product) => product.category, {
		cascade: true,
	})
	public products: Array<Product>;

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;

	public product_count: number;
}
