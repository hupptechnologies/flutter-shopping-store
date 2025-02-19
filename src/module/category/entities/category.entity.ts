import {
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
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

	@TreeParent()
	public parent: Category;

	@TreeChildren()
	public children: Category[];

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;
}
