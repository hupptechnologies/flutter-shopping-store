import { Injectable } from '@nestjs/common';
import { Loggable } from 'src/decorator/loggable/loggable.decorator';

@Injectable()
@Loggable()
export class VoucherService {}
