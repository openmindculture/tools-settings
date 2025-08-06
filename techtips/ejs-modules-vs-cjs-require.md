## EJS ES6+ JS modules vs. CJS require syntax

Abstrait: comparing incompatible CJS (legacy CommonJS) `require` with EJS (ES6+ JS module or mjs) `import` and `export` syntax. En 2025, la configuration des modules CommonJS (CJS) et ECMAScript Modules (ESM) dans un projet Node.js nécessite toujours une attention particulière, surtout si vous souhaitez publier des paquets compatibles avec les deux systèmes de modules.

## ECMAScript Modules (ESM), EJS, ES6+ JavaScript/TypeScript import/export syntax

- `import` and `export` syntax, 
- configured as `"type": "module"` in `package.json`.

Si vous définissez "type": "module", tous les fichiers .js seront traités comme des modules ES.

## CJS = (legacy) Node.js / CommonJS require syntax

- `require` and `module.exports`, 
- sometimes written with `.mjs` file suffix,
- configured as `"type": "commonjs"` in `package.json`.

## Dual Publishing

Pour publier un paquet compatible à la fois avec ESM et CJS, vous devez gérer les champs main et module dans votre package.json. Le champ main doit pointer vers l'entrée CommonJS, tandis que le champ module doit pointer vers l'entrée ESM