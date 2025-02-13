import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { UserRepository } from './user.repository';
import { CloudinaryService } from 'src/services/cloudinary/cloudinary.service';
import { IsUniqueEmailConstraint } from 'src/decorator/isUniqueEmail/is-unique-email.decorator';

@Module({
	imports: [TypeOrmModule.forFeature([User])],
	controllers: [UserController],
	providers: [
		UserService,
		BcryptService,
		UserRepository,
		CloudinaryService,
		IsUniqueEmailConstraint,
	],
	exports: [UserService, BcryptService, UserRepository],
})
export class UserModule {}
