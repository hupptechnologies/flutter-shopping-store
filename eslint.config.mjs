// @ts-check
import eslint from '@eslint/js';
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended';
import globals from 'globals';
import tseslint from 'typescript-eslint';

export default tseslint.config(
	{
		ignores: ['eslint.config.mjs'],
	},
	eslint.configs.recommended,
	...tseslint.configs.recommendedTypeChecked,
	eslintPluginPrettierRecommended,
	{
		languageOptions: {
			globals: {
				...globals.node,
				...globals.jest,
			},
			ecmaVersion: 5,
			sourceType: 'module',
			parserOptions: {
				projectService: true,
				tsconfigRootDir: import.meta.dirname,
			},
		},
	},
	{
		rules: {
			'@typescript-eslint/no-explicit-any': 'off',
			'@typescript-eslint/no-floating-promises': 'warn',
			'@typescript-eslint/no-unsafe-argument': 'warn',
			'@typescript-eslint/interface-name-prefix': 'off',
			'@typescript-eslint/explicit-function-return-type': 'error',
			'@typescript-eslint/explicit-module-boundary-types': 'off',
			indent: ['error', 'tab', { SwitchCase: 1 }],
			'prettier/prettier': ['error', { useTabs: true, tabWidth: 4 }],
			'max-len': ['error', { code: 250, ignoreComments: true, ignoreTrailingComments: true }],
			'@typescript-eslint/no-unused-vars': 'error',
			'object-curly-newline': [
				'error',
				{
					ObjectExpression: 'always',
					ObjectPattern: { multiline: true, minProperties: 8 },
				},
			],
			'object-curly-spacing': ['error', 'always'],
			'object-property-newline': 'error',
			'object-shorthand': 'error',
			'comma-spacing': ['error', { before: false, after: true }],
			'space-in-parens': ['error', 'never'],
			'space-infix-ops': 'error',
			'space-unary-ops': 'error',
			'spaced-comment': ['error', 'always'],
			'no-trailing-spaces': 'error',
			'no-whitespace-before-property': 'error',
			'eol-last': ['error', 'always'],
			'@typescript-eslint/no-unsafe-call': 'off',
			'@typescript-eslint/no-unsafe-function-type': 'off'
		},
	},
);
