# Lettuce Meet App 
![Version][Version.js]

This is the pre-release version of the Lettuce Meet Application.

Our goal is to provide an easy way to organize events between people. Users will be able to make an account and use our sandbox, but only select users with supplied with a code will be able to create events and invite guests.

## Table of Contents

- [Tech Stack](#tech-stack)
- [Local Set Up and Installation](#local-set-up-and-installation)
  * [Set Up Ruby on Rails Locally](#set-up-ruby-on-rails-locally)
    + [Set Up Ruby on Rails App](#set-up-ruby-on-rails-app)
    + [Run the Server](#run-the-server)
  * [Frontend (VueJS)](#frontend--vuejs-)
- [Testing](#testing)
- [Contributing](#contributing)
  * [Pull Request Steps](#pull-request-steps)
  * [Use a Consistent Coding style](#use-a-consistent-coding-style)
  * [Report Bugs with Github [Issues](https://github.com/Sun-Mountain/lettuceMeetApp/issues)](#report-bugs-with-github--issues--https---githubcom-sun-mountain-lettucemeetapp-issues-)
- [Code of Conduct](#code-of-conduct)
  * [Our Pledge](#our-pledge)
  * [Our Standards](#our-standards)
  * [Our Responsibilities](#our-responsibilities)
  * [Scope](#scope)
  * [Attribution](#attribution)

### Tech Stack
[![Ruby][Ruby.js]][Ruby-url]

[![Rails][Rails.js]][Rails-url]

[![Postgres][Postgres.js]][Postgres-url]

# Local Set Up and Installation
To clone the application then change into the directory:

```
git clone git@github.com:Sun-Mountain/lettuceMeetApp.git
cd lettuceMeetApp
```

## Set Up Ruby on Rails Locally

The backend is built with Ruby on Rails with a [PostgreSQL](Postgres-url) database. OSX comes with Ruby already installed. [Homebrew](https://brew.sh/) can be used to install if necessary. For Windows, we recommend [Ruby Installer](https://rubyinstaller.org/).

**Recommended:** Install a ruby version manage like [RVM](https://rvm.io/).

Install and switch to the latest version of Ruby:

```
rvm install 3.0.0
rvm use 3.0.0
```

Homebrew can be used to install postgresql:

```
brew install postgresql
```

Follow the prompts following installation to start running postgres as a service. For postgresql clients, we recommend [Postico](https://eggerapps.at/postico/) or [Postgres.app](https://postgresapp.com/downloads.html).

### Set Up Ruby on Rails App
Install bundler:

1. `gem install bundler --no-document`
2. Run `bundle install`
3. Run `rails db:create db:migrate` to set up the database.

### Run the Server

```
rails s
```

The backend will be running by default on `http://localhost:3000` and the server will be running on port `5432`.

## Frontend (VueJS)

In another terminal, change into the frontend directory:

1. Install package manager `yarn install`
2. Run frontend `yarn serve`

In a browser, go to `http://localhost:8080/` to go to the application.

# Testing

TBA

# Contributing

This is an open source application. We want to make contributing to this project as easy and transparent as possible, whether it's:

* Reporting a bug
* Discussing the current state of code
* Submitting a fix
* Proposing new feature or changes

We use github to host code, track issues and feature requests, as well as accept pull requests.

## Pull Request Steps

Pull requests are the best way to propose changes to the codebase.

1. Fork the repo and create your branch from `main`.
2. Add tests where necessary.
3. Ensure the test suite passes.
4. Make sure your code lints.
5. Issue that pull request!

## Use a Consistent Coding style

* 2 spaces for indentation rather than tabs

## Report Bugs with Github [Issues](https://github.com/Sun-Mountain/lettuceMeetApp/issues)

Bugs are a reality of code and we appreciate people finding and reporting them in our app.

**Bug Reports Should Include:**

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can.
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

# Code of Conduct

## Our Pledge

In the interest of fostering an open and welocming environment, we as contributors and maintainers pledge to make participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.

## Our Standards

Examples of behavior that contributes to creating a positive environment include:

* Using welcoming and inclusive language
* Being respectful of differing viewpoints and experiements
* Gracefully accepting constructive crticism
* Focusing on what is best for the community
* Showing empathy towards other community members

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery and unwelcome sexual attention or advances
* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others’ private information, such as a physical or electronic address, without explicit permission
* Other conduct which could reasonably be considered inappropriate in a professional setting

## Our Responsibilities

Project maintainers are responsible for clarifying the standards of aceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.

## Scope

This Code of Conduct applies within all project spaces, and it also applies when an individual is representing the project or its community in public spaces. Examples of representing a project or community include using an official project e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event. Representation of a project may be further defined and clarified by project maintainers.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant](http://contributor-covenant.org/), version 1.4, available at https://www.contributor-covenant.org/version/1/4/code-of-conduct.html

<!-- MARKDOWN LINKS & IMAGES -->
[Version.js]: https://img.shields.io/github/v/release/sun-mountain/lettucemeetapp?include_prereleases
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Ruby.js]: https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails.js]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres.js]: https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
