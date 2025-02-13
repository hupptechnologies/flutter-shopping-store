import { Logger } from '@nestjs/common';

export function Loggable(): ClassDecorator {
	return function (target: Function) {
		const prototype = target.prototype as Record<string, unknown>;

		if (!prototype.logger) {
			prototype.logger = new Logger(target.name);
		}
		const logger = prototype.logger as Logger;

		const methodNames = Object.getOwnPropertyNames(prototype).filter(
			(method) => method !== 'constructor' && typeof prototype[method] === 'function',
		);

		for (const methodName of methodNames) {
			const descriptor = Object.getOwnPropertyDescriptor(prototype, methodName);
			if (!descriptor) continue;

			const originalMethod = descriptor.value as (...args: unknown[]) => unknown;

			const isAsync = originalMethod.constructor.name === 'AsyncFunction';

			if (isAsync) {
				prototype[methodName] = async function (...args: unknown[]): Promise<unknown> {
					logger.debug(`${target.name} --> ${methodName} method start`);
					const result: unknown = await originalMethod.apply(this, args);
					logger.debug(`${target.name} --> ${methodName} method end`);
					return result;
				};
			} else {
				prototype[methodName] = function (...args: unknown[]): unknown {
					logger.debug(`${target.name} --> ${methodName} method start`);
					const result: unknown = originalMethod.apply(this, args);
					logger.debug(`${target.name} --> ${methodName} method end`);
					return result;
				};
			}
		}
	};
}
