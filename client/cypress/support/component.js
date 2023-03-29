// ***********************************************************
// This example support/component.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import vuetify from '@/plugins/vuetify';
import './commands';
import '@/plugins/support';
import { createTestingPinia } from '@pinia/testing'

// Alternatively you can use CommonJS syntax:
// require('./commands')

import { mount } from 'cypress/vue'

Cypress.Commands.add('mount', (component) => {
  return mount(component, {
    global: { plugins: [vuetify, createTestingPinia({ createSpy: () => cy.spy() })] }
  })
})

// Example use:
// cy.mount(MyComponent)