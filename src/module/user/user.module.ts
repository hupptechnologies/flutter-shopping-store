import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { UserRepository } from './user.repository';
import { MailModule } from 'src/services/mail/mail.module';
import { CloudinaryModule } from 'src/services/cloudinary/cloudinary.module';

@Module({
	imports: [CloudinaryModule, TypeOrmModule.forFeature([User]), MailModule],
	controllers: [UserController],
	providers: [UserService, BcryptService, UserRepository],
	exports: [UserService, BcryptService, UserRepository],
})
export class UserModule {}
