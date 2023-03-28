/* eslint-disable no-undef */
import LoginUser from './LoginUser.vue';

describe('<LoginUser />', () => {
  it('renders', () => {
    // see: https://on.cypress.io/mounting-vue
    cy.mount(LoginUser)
  })
})
