export class ValidationMsgConstant {
	static readonly IS_EMAIL = 'Please provide a valid email address';
	static readonly PHONE_NUMBER = 'Please provide a valid mobile number';
	static readonly IS_STRONG_PASSWORD = 'Password is not strong enough';
	static readonly INVALID_OTP_LENGTH = 'OTP must be a 4-digit number.';
	static readonly PAGE_INTEGET = 'Page must be an integer';
	static readonly LIMIT_INTEGET = 'Limit must be an integer';
	static readonly SEARCH_NOT_EMPTY = 'Search field cannot be empty';
	static readonly GENDER_ENUM = 'Gender must be either male, female, or other';
	static readonly CARD_EXPIRATION_DATE = 'Expiration date must be in MM/YY or MM/YYYY format';
	static readonly QUANTITY_MIN_ZERO = 'Quantity must be 0 or greater';
	static readonly INSUFFICIENT_STOCK = (availableStock: number, requested: number): string =>
		`Only ${availableStock} items available in stock. You requested ${requested}.`;
}
