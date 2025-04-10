#bun
abbr -a bun-remove-eslint "bun remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a bun-add-husky-lint "bun add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && bunx husky init && echo 'bunx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"


#npm
abbr -a npm-remove-eslint "npm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a npm-add-husky-lint "npm install --save-dev @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && npx husky init && echo 'npx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"


#pnpm
abbr -a pnpm-remove-eslint "pnpm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a pnpm-add-husky-lint "pnpm add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && pnpm exec husky init && echo 'pnpm exec commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"


#yarn
abbr -a yarn-remove-eslint "yarn remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a yarn-add-husky-lint "yarn add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && yarn dlx husky init && echo 'yarn dlx commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
