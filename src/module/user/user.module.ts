import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { UserRepoModule } from '../../repository/user/user-repo.module';
import { BcryptService } from '../../services/bcrypt/bcrypt.service';
import { CloudinaryModule } from '../../services/cloudinary/cloudinary.module';
import { MailModule } from '../../services/mail/mail.module';

@Module({
	imports: [CloudinaryModule, UserRepoModule, MailModule],
	controllers: [UserController],
	providers: [UserService, BcryptService],
	exports: [UserService, BcryptService],
})
export class UserModule {}
