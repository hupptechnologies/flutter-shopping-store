export abstract class ErrorMsgConstant {
	static readonly UNAUTHORIZED = 'Unauthorized access';
	static readonly DATABASE_ERROR = 'Database error occurred';
	static readonly SOMETHING_WRONG = 'Something went wrong. Please try again.';
	static readonly INVALID_OTP = 'Invalid OTP';
	static readonly OTP_EXPIRED = 'OTP expired';
	static readonly OTP_NOT_VERIFIED = 'OTP has not been verified. Please verify your OTP first.';
	static readonly SAME_PASSWORD_NOT_ALLOWED =
		'You cannot use your previous password as your new password.';
}
