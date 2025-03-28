import { Module } from '@nestjs/common';
import { ShippingMothodService } from './shipping-mothod.service';

@Module({
	providers: [ShippingMothodService],
})
export class ShippingMothodModule {}
