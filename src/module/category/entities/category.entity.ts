import { Gender } from 'src/common/enum/gender.enum';
import { Image } from 'src/module/image/entities/image.entity';
import { Product } from 'src/module/product/entities/product.entity';
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
}
