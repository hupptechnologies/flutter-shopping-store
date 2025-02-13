import { Logger } from '@nestjs/common';

export function Loggable(): ClassDecorator {
	return function (target: Function) {
		const logger = new Logger(target.name);

		const prototype = target.prototype as Record<string, unknown>;

		const methodNames = Object.getOwnPropertyNames(prototype).filter(
			(method) => method !== 'constructor' && typeof prototype[method] === 'function',
		);

		for (const methodName of methodNames) {
			const originalMethod = prototype[methodName] as (...args: unknown[]) => unknown;

			prototype[methodName] = function (...args: unknown[]): unknown {
				logger.debug(`${target.name} --> ${String(methodName)} method start`);

				const result: unknown = originalMethod.apply(this, args);

				logger.debug(`${target.name} --> ${String(methodName)} method end`);

				return result;
			};
		}
	};
}
