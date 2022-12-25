// https://docs.cypress.io/api/introduction/api.html

describe("My First Test", () => {
  it("register user", () => {
    cy.visit("/account/register");
    cy.intercept("POST", "http://127.0.0.1:3000", {}).as("backendAPI");
    cy.findByRole("heading", { name: /Register/ }).should("exist");
    cy.get("#FirstName").type("Jean Luc");
    cy.get("#LastName").type("Picard");
    cy.get("#RegisterUsername").type("Captain");
    cy.get("#RegisterEmail").type("picard@gmail.com");
    cy.get("#RegisterPassword").type("securePassw0rdLOL");
    cy.get("#PasswordConfirmation").type("securePassw0rdLOL");
    cy.getByRole("button", { name: /Register/ }).click();
  });
});
