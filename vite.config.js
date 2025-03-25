const tailwindcss = require("@tailwindcss/vite");
const { defineConfig } = require("vite");

module.exports = defineConfig({
    plugins: [
        tailwindcss(),
    ],
});