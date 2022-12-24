// https://docs.cypress.io/api/introduction/api.html

describe("CRUD User Account", () => {
  let first_name = "Sweeney",
    last_name = "Todd",
    user_name = "BarberOnFleet",
    email = "todd@gmail.com",
    password = "securePassw0rdLOL";

  describe("registration form", () => {
    it("allows user to create account", () => {
      cy.visit("/account/register");

      cy.findByRole("heading", { name: /Register/ }).should("exist");
      cy.get("#FirstName").type(first_name);
      cy.get("#LastName").type(last_name);
      cy.get("#RegisterUsername").type(user_name);
      cy.get("#RegisterEmail").type(email);
      cy.get("#RegisterPassword").type(password);
      cy.get("#PasswordConfirmation").type(password);

      cy.getByRole("button", { name: /Register/ }).click();

      // eslint-disable-next-line cypress/no-unnecessary-waiting
      cy.wait(5000).findByText("Registration successful").should("exist");
    });
  });

  describe("login and profile forms", () => {
    it("allows user with account to login", () => {
      cy.visit("/");
      cy.get("#LoginEmail").type(email);
      cy.get("#LoginPassword").type(password);
      cy.getByRole("button", { name: /Login/ }).click();

      // eslint-disable-next-line cypress/no-unnecessary-waiting
      cy.wait(1200).findByText(`Hi ${user_name}!`).should("exist");
      cy.findByText("Profile").click();
      cy.findByText("Profile Settings").should("exist");

      cy.findByRole("button", { name: /Delete Your Account/ })
        .should("have.class", "collapsed")
        .click()
        .should("not.have.class", "collapsed");

      cy.get("#passwordToDelete").type(password);
      cy.findByRole("button", { name: /Delete Account/ }).click();
      // eslint-disable-next-line cypress/no-unnecessary-waiting
      cy.wait(1000).findByText("Account successfully deleted").should("exist");
    });
  });
});
