declare global {
	interface Array {
		readonly isEmpty: boolean;
	}
}

Object.defineProperty(Array.prototype, 'isEmpty', {
	get() {
		return this.length === 0;
	},
});

export { Array };
