fmt			:
	npx prettier --write --plugin=prettier-plugin-solidity 'src/**/*.sol' 'test/**/*.sol'

install	:
	forge init --force
	npm install --save-dev prettier prettier-plugin-solidity

.PHONY: install fmt