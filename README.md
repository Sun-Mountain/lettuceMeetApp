# Lettuce Meet Application
This is the pre-release version of the Lettuce Meet Application.

## Set Up & Installation
To clone the application then change into the directory:

```
git clone git@github.com:Sun-Mountain/lettuceMeetApp.git
cd lettuceMeetApp
```

### API - Ruby on Rails

#### Prerequisits
The backend is built with Ruby on Rails with a [PostgreSQL](https://github.com/Sun-Mountain/lettuceMeetApp/blob/main/Postgres-url) database. OSX comes with Ruby already installed. [Homebrew](https://brew.sh/) can be used to install if needed. For Windows, we recommend [Ruby Installer](https://rubyinstaller.org/).

Recommended: Install a ruby version manager like [RVM](https://rvm.io/).

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

### Frontend - VueJS
