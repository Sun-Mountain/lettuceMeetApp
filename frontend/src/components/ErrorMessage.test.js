// ErrorMessage.spec.js
import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import { createStore } from 'vuex'
import ErrorMessage from './ErrorMessage.vue'

// you need to mock router
vi.mock('vue-router', () => ({
  resolve: vi.fn(),
}));

describe('ErrorMessage', () => {
  it('appears if error present', async () => {
    const errorMsg = "This is an error";

    const mockStore = createStore({
      state: {
        errors: errorMsg
      },
    });

    const wrapper = mount(ErrorMessage, {
      mockStore
    });

    await expect(wrapper.text()).toContain(errorMsg)
  })
})
