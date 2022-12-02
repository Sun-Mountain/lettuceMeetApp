import { describe, expect, it } from "vitest";
import { mount } from "@vue/test-utils";
import App from "./App.vue";
import { createTestingPinia } from "@pinia/testing";
import { router } from "./router";

describe("<App />", () => {
  it("renders", () => {
    // see: https://test-utils.vuejs.org/guide/
    const pinia = createTestingPinia();
    const wrapper = mount(App, {
      global: {
        plugins: [router, pinia],
      },
    });
    expect(wrapper).toBeTruthy;
  });
});
