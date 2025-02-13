import { CustomDecorator, SetMetadata } from '@nestjs/common';

export const PUBLIC_KEY = 'isPublic';
export const Public = (): CustomDecorator<string> => SetMetadata(PUBLIC_KEY, true);
