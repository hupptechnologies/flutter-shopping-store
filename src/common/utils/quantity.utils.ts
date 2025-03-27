import { BadRequestException } from '@nestjs/common';
import { ValidationMsgConstant } from '../constant/validation-msg.constant';

export class QuantityUtils {
	/**
	 * Validates the requested quantity against available stock.
	 * @param requestedQuantity - The quantity user wants to add.
	 * @param availableStock - The current stock available.
	 */
	public static validateStock(requestedQuantity: number, availableStock: number): void {
		if (requestedQuantity > availableStock) {
			throw new BadRequestException(
				ValidationMsgConstant.INSUFFICIENT_STOCK(availableStock, requestedQuantity),
			);
		}
	}

	/**
	 * Calculates the new quantity for the cart.
	 * Ensures that it does not exceed available stock.
	 * @param currentQuantity - The quantity already in the cart.
	 * @param addedQuantity - The new quantity user wants to add.
	 * @param availableStock - The total stock available.
	 * @returns The updated quantity that should be stored in the cart.
	 */
	public static calculateNewQuantity(
		currentQuantity: number,
		addedQuantity: number,
		availableStock: number,
	): number {
		const newQuantity = currentQuantity + addedQuantity;

		if (newQuantity > availableStock) {
			throw new BadRequestException(
				ValidationMsgConstant.INSUFFICIENT_STOCK(availableStock, newQuantity),
			);
		}

		return newQuantity;
	}
}
