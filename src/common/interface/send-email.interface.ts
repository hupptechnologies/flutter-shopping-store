export interface SendMailPaylaod {
	to: string;
	subject: string;
	template: string;
	context: {
		[name: string]: any;
	};
}
