import { ConfigService } from '@nestjs/config';

export const EnvVar = (key: string): PropertyDecorator => {
	return (target: any, propertyKey: string | symbol) => {
		Object.defineProperty(target, propertyKey, {
			get() {
				const configService = this.configService as ConfigService;
				if (!configService) {
					throw new Error(`❌ ConfigService is not available for ${String(propertyKey)}`);
				}

				const value = configService.get<string>(key);
				if (!value) {
					throw new Error(`❌ Missing environment variable: ${key}`);
				}

				return value;
			},
			enumerable: true,
			configurable: true,
		});
	};
};
