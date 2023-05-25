Cypress.session.clearAllSavedSessions();

describe('Valid Registration and Login', function () {
  it ('confirms registration form validation', function () {
    cy.visit('/register');
    // cy.findByRole('heading', { name: /Log in/i }).should('exist');
  })
})
