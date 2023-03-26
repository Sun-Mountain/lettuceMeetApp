import { createVuetify } from "vuetify";
import LoginUser from './LoginUser.vue'

describe('<LoginUser />', () => {
  const vuetify = createVuetify()

  it('renders', () => {
    // see: https://on.cypress.io/mounting-vue
    cy.mount(LoginUser, {
      global: { plugins: [vuetify] }
    })
  })
})
