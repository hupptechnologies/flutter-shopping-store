import { IsEnum, IsNumberString, Length, Matches } from 'class-validator';
import { RegexConstant } from '../../../common/constant/regex.constant';
import { ValidationMsgConstant } from '../../../common/constant/validation-msg.constant';
import { CardTypeEnum } from '../../../common/enum/card-type.enum';
import { IsNotEmpty } from '../../../decorator/validation/is-not-empty.decorator';

export class CreateCardsDto {
	@IsNotEmpty()
	public cardholderName: string;

	@IsNumberString()
	@Length(16, 16)
	public cardNumber: string;

	@IsNumberString()
	@Length(3, 4)
	public cvv: string;

	@IsNotEmpty()
	@Matches(RegexConstant.CARD_EXPIRATION_DATE, {
		message: ValidationMsgConstant.CARD_EXPIRATION_DATE,
	})
	public expirationDate: string;

	@IsEnum(CardTypeEnum)
	public type: CardTypeEnum;
}
