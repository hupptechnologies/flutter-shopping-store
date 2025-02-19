import { Exclude } from 'class-transformer';
import { Category } from 'src/module/category/entities/category.entity';
import { BaseEntity, Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Image extends BaseEntity {
	@PrimaryGeneratedColumn()
	public id: number;

	@Column()
	public url: string;

	@Exclude()
	@Column()
	public public_id: string;

	@Exclude()
	@ManyToOne(() => Category, (category) => category.id, {
		onDelete: 'CASCADE',
		nullable: true,
	})
	public category: Category;
}
