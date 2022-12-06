const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    specPattern: "cypress/e2e/**/*.{cy,spec}.{js,jsx,ts,tsx}",
    baseUrl: "http://127.0.0.1:5173/"
  },

  component: {
    devServer: {
      framework: "vue",
      bundler: "vite",
    },
  },
});
