import { Exclude } from 'class-transformer';
import { Category } from 'src/module/category/entities/category.entity';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import {
	AfterRemove,
	AfterSoftRemove,
	BaseEntity,
	Column,
	CreateDateColumn,
	DeleteDateColumn,
	Entity,
	ManyToOne,
	PrimaryGeneratedColumn,
	UpdateDateColumn,
} from 'typeorm';

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

	@CreateDateColumn()
	public createdAt: Date;

	@UpdateDateColumn()
	public updatedAt: Date;

	@DeleteDateColumn()
	public deletedAt: Date | null;

	@AfterRemove()
	@AfterSoftRemove()
	afterSoftRemove(): void {
		CloudinaryService.deleteItem(this.public_id);
	}
}
