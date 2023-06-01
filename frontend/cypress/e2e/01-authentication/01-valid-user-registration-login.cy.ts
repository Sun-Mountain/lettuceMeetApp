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
    cy.intercept('POST', `http://127.0.0.1:3000/signup`, {}).as(
      'submitForm'
    );
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

  it ('allows user login', function () {
    cy.visit('/login');
    cy.get("[data-test=email]").clear().type(user1.email);
    cy.get("[data-test=password]").clear().type(user1.password);

    cy.contains('Login').click();
  })

  it ('allows user to delete account', function () {
    cy.visit('/account');

    cy.contains('Edit').click();
    cy.get("[data-test=delete-account]").clear().type(user1.password);
    cy.contains('Delete Account').click();

    cy.get('.v-card-title').contains('Login').should('exist')
  })
})
