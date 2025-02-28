import { Category } from 'src/module/category/entities/category.entity';
import { Image } from 'src/module/image/entities/image.entity';
import {
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	ManyToOne,
	OneToMany,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Product {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public name: string;

	@Column({
		type: 'text',
		nullable: true,
	})
	public description: string;

	@ManyToOne(() => Category, (category) => category.products, {
		onDelete: 'CASCADE',
	})
	public category: Category;

	@OneToMany(() => Image, (image) => image.category, {
		eager: true,
		cascade: true,
	})
	public images: Image[];

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
