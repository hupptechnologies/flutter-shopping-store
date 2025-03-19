import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { BcryptService } from 'src/services/bcrypt/bcrypt.service';
import { MailModule } from 'src/services/mail/mail.module';
import { CloudinaryModule } from 'src/services/cloudinary/cloudinary.module';
import { UserRepoModule } from 'src/repository/user/user-repo.module';

@Module({
	imports: [CloudinaryModule, UserRepoModule, MailModule],
	controllers: [UserController],
	providers: [UserService, BcryptService],
	exports: [UserService, BcryptService],
})
export class UserModule {}
