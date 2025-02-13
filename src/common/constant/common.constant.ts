import { ResponseDecoratorOptions } from '@nestjs/common';

export class CommonConstant {
	static readonly responseDecoratorOptions: ResponseDecoratorOptions = {
		passthrough: true,
	};
}
