import { Test, TestingModule } from '@nestjs/testing';
import { ShippingMothodService } from './shipping-mothod.service';

describe('ShippingMothodService', () => {
	let service: ShippingMothodService;

	beforeEach(async () => {
		const module: TestingModule = await Test.createTestingModule({
			providers: [ShippingMothodService],
		}).compile();

		service = module.get<ShippingMothodService>(ShippingMothodService);
	});

	it('should be defined', () => {
		expect(service).toBeDefined();
	});
});
