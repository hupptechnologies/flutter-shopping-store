import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Loggable()
export class CommonUtils {
	static removeKey<T extends object, K extends keyof T>(obj: T, keys: K | Array<K>): T {
		const keyArray = Array.isArray(keys) ? keys : [keys];
		keyArray.forEach((key) => {
			delete obj[key];
		});
		return obj;
	}
}
