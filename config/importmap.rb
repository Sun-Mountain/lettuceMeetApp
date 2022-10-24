# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/custom', under: 'custom'

pin 'stimulus-flatpickr', to: 'https://ga.jspm.io/npm:stimulus-flatpickr@3.0.0-0/dist/index.m.js'
pin 'flatpickr', to: 'https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js'
