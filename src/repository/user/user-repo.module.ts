import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserRepository } from './user.repository';
import { User } from '../../module/user/entities/user.entity';

@Module({
	imports: [TypeOrmModule.forFeature([User])],
	providers: [UserRepository],
	exports: [UserRepository],
})
export class UserRepoModule {}
