import { PartialType } from '@nestjs/mapped-types';
import { CreateAddressDto } from './create-address.dto';
import { IsOptional } from 'class-validator';

export class UpdateAddressDto extends PartialType(CreateAddressDto) {
	@IsOptional()
	public isDefault?: boolean;
}
