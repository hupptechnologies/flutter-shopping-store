export abstract class KeyConstant {
	static readonly IMAGE = 'image';

	static readonly ACCESS_TOKEN = 'accessToken';
	static readonly REFRESH_TOKEN = 'refreshToken';

	static readonly ENV_JWT_SECRET_KEY = 'JWT_SECRET_KEY';

	static readonly ACCESS_TOKEN_EXPIRES = '30m';
	static readonly REFRESH_TOKEN_EXPIRES = '7d';

	static readonly ACCESS_TOKEN_MAX_AGE = 30 * 60 * 1000;
	static readonly REFRESH_TOKEN_MAX_AGE = 7 * 24 * 60 * 60 * 1000;

	static readonly IS_UNIQUE_EMAIL = 'IsUniqueEmail';

	static readonly ID = 'id';

	static readonly IS_NOT_EMPTY = 'IsNotEmpty';
}
