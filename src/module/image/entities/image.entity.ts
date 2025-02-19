import { Category } from 'src/module/category/entities/category.entity';
import { BaseEntity, Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Image extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public url: string;

	@ManyToOne(() => Category, (category) => category.id, {
		eager: true,
		onDelete: 'CASCADE',
		nullable: true,
	})
	public category: Category;
}
