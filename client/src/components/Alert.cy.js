import Alert from './Alert.vue'

describe('<Alert />', () => {
  it('renders', () => {
    // see: https://on.cypress.io/mounting-vue
    cy.mount(Alert)
  })
})