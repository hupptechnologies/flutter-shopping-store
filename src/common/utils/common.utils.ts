import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
export class CommonUtils {
	static removeKey<T extends object, K extends keyof T>(obj: T, key: K): T {
		delete obj[key];
		return obj;
	}
}
