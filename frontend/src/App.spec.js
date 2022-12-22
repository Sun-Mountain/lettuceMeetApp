import { describe, expect, it } from "vitest";
import { mount } from "@vue/test-utils";
import { createTestingPinia } from "@pinia/testing";
import { router } from "./router";

import App from "./App.vue";

describe("<App />", () => {
  it("renders", () => {
    // see: https://test-utils.vuejs.org/guide/
    const pinia = createTestingPinia();
    const wrapper = mount(App, {
      global: {
        plugins: [router, pinia],
      },
    });
    expect(wrapper.text()).toContain("Home");
  });
});
