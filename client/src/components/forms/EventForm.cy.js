import EventForm from './EventForm.vue'

describe('<EventForm />', () => {
  it('renders', () => {
    // see: https://on.cypress.io/mounting-vue
    cy.mount(EventForm)
  })
})