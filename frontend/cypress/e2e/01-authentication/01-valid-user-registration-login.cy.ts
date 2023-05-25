Cypress.session.clearAllSavedSessions();

const user1 = {
  first_name: 'Thomas',
  last_name: 'Nightingale',
  username: 'Nightingale',
  email: 'nightingale@gmail.com',
  password: 'password1234'
}

describe('Valid Registration and Login', function () {
  it ('accept and notice registration', function () {
    cy.visit('/register');
    // cy.findByRole('heading', { name: /Log in/i }).should('exist');
    cy.get("[data-test=first-name]").clear().type(user1.first_name);
    cy.get("[data-test=last-name]").clear().type(user1.last_name);
    cy.get("[data-test=username]").clear().type(user1.username);
    cy.get("[data-test=email]").clear().type(user1.email);
    cy.get("[data-test=password]").clear().type(user1.password);
    cy.get("[data-test=confirm-password]").clear().type(user1.password);

    cy.contains('Submit Registration').click();
    cy.wait('@submitForm')

    cy.get('.v-card-title').contains('Login').should('exist')
  })
})
