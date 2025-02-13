import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { UserRepository } from './user.repository';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';

@Module({
	imports: [TypeOrmModule.forFeature([User])],
	controllers: [UserController],
	providers: [UserService, BcryptService, UserRepository, CloudinaryService],
	exports: [UserService, BcryptService, UserRepository],
})
export class UserModule {}
