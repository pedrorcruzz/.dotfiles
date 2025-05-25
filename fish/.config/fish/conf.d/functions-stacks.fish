function create-jsconfig-json
    if not test -e jsconfig.json
        echo '{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "jsx": "react-jsx",
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["src"]
}' > jsconfig.json
    end
end
