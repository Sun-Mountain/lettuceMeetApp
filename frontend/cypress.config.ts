import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5173/',
    viewportWidth: 1000,
    viewportHeight: 1000,
    videoUploadOnPasses: false,
    env: {
      VITE_API_URL: 'http://localhost:3000'
    }
  },
});
