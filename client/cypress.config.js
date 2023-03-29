const { defineConfig } = require("cypress");

module.exports = defineConfig({
  component: {
    devServer: {
      framework: "vue",
      bundler: "vite",
    },
  },

  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    environment: 'development',
    baseUrl: 'http://localhost:5173/',
    videoUploadOnPasses: false,
    env: {
      API: import.meta.env.VITE_API_URL || 'http://localhost:3000/'
    }
  },
});
