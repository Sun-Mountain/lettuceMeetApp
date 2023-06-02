Cypress.session.clearAllSavedSessions();

const newUser = {
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
    cy.get("[data-test=first-name]").clear().type(newUser.first_name);
    cy.get("[data-test=last-name]").clear().type(newUser.last_name);
    cy.get("[data-test=username]").clear().type(newUser.username);
    cy.get("[data-test=email]").clear().type(newUser.email);
    cy.get("[data-test=password]").clear().type(newUser.password);
    cy.get("[data-test=confirm-password]").clear().type(newUser.password);

    cy.contains('Submit Registration').click();
    cy.wait('@submitForm')

    cy.get('.v-card-title').contains('Login').should('exist')
  })

  it ('allows user login', function () {
    // before it's sent to the destination
    cy.intercept('POST', '/login', (req) => {
      req.body = {
        user: {
          email: newUser.email,
          password: newUser.password
        }
      }
    })

    // dynamically set the alias
    cy.intercept('POST', '/login', (req) => {
      req.alias = 'login'
    })
    // cy.intercept('POST', `http://127.0.0.1:3000/login`, {
    //   body: {
    //     admin: false,
    //     email: newUser.email,
    //     first_name: newUser.first_name,
    //     id: 1,
    //     last_name: newUser.last_name,
    //     username: newUser.username 
    //   },
    //   status: {
    //     code: 200,
    //     message: "Logged in successfully."
    //   },
    //   token: "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlNTMyOGUxNi03ODM5LTQwYmYtYThhNC1lYTM1YjlkMzBmZDUiLCJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjg1NzI3MzU1LCJleHAiOjE2ODc0NTUzNTV9.ZCFhC535XJqJ2GfWclJSrN7x0KD1hMfsLZ1OTrxQKDs"
    // }).as(
    //   'submitForm'
    // );
    cy.visit('/login');
    cy.get("[data-test=email]").clear().type(newUser.email);
    cy.get("[data-test=password]").clear().type(newUser.password);

    cy.contains('Login').click();
    cy.wait(500);
    cy.wait('@submitForm');
  })

  it ('allows user to delete account', function () {
    cy.visit('/account');

    cy.contains('Edit').click();
    cy.get("[data-test=delete-account]").clear().type(newUser.password);
    cy.contains('Delete Account').click();

    cy.get('.v-card-title').contains('Login').should('exist')
  })
})
