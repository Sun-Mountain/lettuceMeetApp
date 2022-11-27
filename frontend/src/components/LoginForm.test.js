// LoginForm.spec.js
import { describe, it, expect, vi } from 'vitest';
import { mount } from '@vue/test-utils';
import { createStore } from 'vuex';
import LoginForm from './LoginForm.vue';

// you need to mock router
vi.mock('vue-router', () => ({
  resolve: vi.fn(),
}));

describe('LoginForm Component', () => {
  it('renders', () => {
    const wrapper = mount(LoginForm);

    expect(wrapper.text()).toContain("Login!");

    let button = wrapper.find("button");

    expect(button.text()).toEqual("Login");
  });
});
