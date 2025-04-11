#bun
abbr -a bun-remove-eslint "bun remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a bun-add-husky-lint "bun add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && bunx husky init && echo 'bunx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a bun-add-tailwind-vite "bun add -D tailwindcss @tailwindcss/vite"
abbr -a bun-add-biome "bun add -D @biomejs/biome && bunx biome init"
abbr -a bun-add-react-libs "bun add react-router-dom"

#npm
abbr -a npm-remove-eslint "npm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a npm-add-husky-lint "npm install --save-dev @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && npx husky init && echo 'npx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a npm-add-tailwind-vite "npm install --save-dev tailwindcss @tailwindcss/vite"
abbr -a npm-add-biome "npm install --save-dev @biomejs/biome && npx biome init"
abbr -a npm-add-react-libs "npm install react-router-dom"


#pnpm
abbr -a pnpm-remove-eslint "pnpm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a pnpm-add-husky-lint "pnpm add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && pnpm exec husky init && echo 'pnpm exec commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a pnpm-add-tailwind-vite "pnpm add -D tailwindcss @tailwindcss/vite"
abbr -a pnpm-add-biome "pnpm add -D @biomejs/biome && pnpm exec biome init"
abbr -a pnpm-add-react-libs "pnpm add react-router-dom"

#yarn
abbr -a yarn-remove-eslint "yarn remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a yarn-add-husky-lint "yarn add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && yarn dlx husky init && echo 'yarn dlx commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a yarn-add-tailwind-vite "yarn add -D tailwindcss @tailwindcss/vite"
abbr -a yarn-add-biome "yarn add -D @biomejs/biome && yarn dlx biome init"
abbr -a yarn-add-react-libs "yarn add react-router-dom"
