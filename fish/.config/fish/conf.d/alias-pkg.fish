#bun
abbr -a bun-remove-eslint "bun remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a bun-add-husky-lint "bun add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && bunx husky init && echo 'bunx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a bun-add-biome "bun add -D @biomejs/biome && bunx biome init"

abbr -a bun-add-vite-tailwind "bun add -D tailwindcss @tailwindcss/vite"
abbr -a bun-add-react-libs "bun add react-router-dom"
abbr -a bun-add-animations "bun add motion"

abbr -a bun-create-react "bunx create-react-app@latest"
abbr -a bun-create-next "bunx create-next-app@latest"
abbr -a bun-create-vite "bunx create-vite@latest"
abbr -a bun-create-vite-react "bun add react react-dom @vitejs/plugin-react"

abbr -a bun-create-remix "bunx create-remix@latest"


#npm
abbr -a npm-remove-eslint "npm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a npm-add-husky-lint "npm install --save-dev @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && npx husky init && echo 'npx --no -- commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a npm-add-biome "npm install --save-dev @biomejs/biome && npx biome init"

abbr -a npm-add-vite-tailwind "npm install --save-dev tailwindcss @tailwindcss/vite"
abbr -a npm-add-react-libs "npm install react-router-dom"
abbr -a npm-add-animations "npm install motion"

abbr -a npm-create-react "npx create-react-app@latest"
abbr -a npm-create-next "npx create-next-app@latest"
abbr -a npm-create-vite "npx create-vite@latest"
abbr -a npm-create-vite-react "npm install react react-dom @vitejs/plugin-react"

abbr -a npm-create-remix "npx create-remix@latest"


#pnpm
abbr -a pnpm-remove-eslint "pnpm remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a pnpm-add-husky-lint "pnpm add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && pnpm exec husky init && echo 'pnpm exec commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a pnpm-add-biome "pnpm add -D @biomejs/biome && pnpm exec biome init"

abbr -a pnpm-add-vite-tailwind "pnpm add -D tailwindcss @tailwindcss/vite"
abbr -a pnpm-add-animations "pnpm add motion"
abbr -a pnpm-add-react-libs "pnpm add react-router-dom"

abbr -a pnpm-create-react "pnpm create react-app@latest"
abbr -a pnpm-create-next "pnpm create next-app@latest"
abbr -a pnpm-create-vite "pnpm create vite@latest"
abbr -a pnpm-create-vite-react "pnpm add react react-dom @vitejs/plugin-react"

abbr -a pnpm-create-remix "pnpm create remix@latest"


#yarn
abbr -a yarn-remove-eslint "yarn remove @eslint/js eslint eslint-plugin-react-hooks eslint-plugin-react-refresh typescript-eslint && rm eslint.config.js eslint.config.cjs"
abbr -a yarn-add-husky-lint "yarn add -D @commitlint/cli @commitlint/config-conventional husky && touch commitlint.config.mjs && yarn dlx husky init && echo 'yarn dlx commitlint --edit \$1' > .husky/commit-msg && printf 'export default {\n  extends: [\"@commitlint/config-conventional\"],\n};\n' > commitlint.config.mjs"
abbr -a yarn-add-biome "yarn add -D @biomejs/biome && yarn dlx biome init"

abbr -a yarn-add-vite-tailwind "yarn add -D tailwindcss @tailwindcss/vite"
abbr -a yarn-add-react-libs "yarn add react-router-dom"
abbr -a yarn-add-animations "yarn add motion"

abbr -a yarn-create-react "yarn create react-app@latest"
abbr -a yarn-create-next "yarn create next-app@latest"
abbr -a yarn-create-vite "yarn create vite@latest"
abbr -a yarn-create-vite-react "yarn add react react-dom @vitejs/plugin-react"

abbr -a yarn-create-remix "yarn create remix@latest"
