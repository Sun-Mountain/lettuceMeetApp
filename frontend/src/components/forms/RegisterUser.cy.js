/* eslint-disable no-undef */
import RegisterUser from './RegisterUser.vue'

describe('<RegisterUser />', () => {
  it('renders', () => {
    // see: https://on.cypress.io/mounting-vue
    cy.mount(RegisterUser)
  })
})