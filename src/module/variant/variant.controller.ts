import { Controller } from '@nestjs/common';
import { VariantService } from './variant.service';

@Controller('variant')
export class VariantController {
  constructor(private readonly variantService: VariantService) {}
}
