# LettuceMeetApp
This is the pre-release version of the Lettuce Meet Application.

LettuceMeetApp is an event management application that allows users to create and manage events, RSVP to events, and keep track of their own event attendance. This application is built with a Ruby on Rails API and a Vue.js client.

## Local Installation
Before you can run the application, you must have [Ruby](https://mac.install.guide/ruby/13.html), [Ruby on Rails](https://gorails.com/setup/macos/13-ventura), [PostgreSQL](https://wiki.postgresql.org/wiki/Homebrew), [Node.js](https://formulae.brew.sh/formula/node), and [VueJS](https://vuejs.org/guide/introduction.html) installed on your machine.

**Other tools that might help:**
- [Homebrew](https://brew.sh/) - for installing Ruby, Rails, Postgres, and Node.js
- [Ruby Installer](https://rubyinstaller.org/) - installing Ruby on Windows
- [RVM](https://rvm.io/) - ruby version manager
- [Postico](https://eggerapps.at/postico/) or [Postgres.app](https://postgresapp.com/downloads.html) - postgres clients

Once you have those installed, follow these steps:

1. Clone the repository from GitHub:

```bash
git clone https://github.com/Sun-Mountain/lettuceMeetApp
cd lettuceMeetApp
```

### API

2. Install dependencies:

```bash
cd api
bundle install
```

You made need to make sure you have the correct version of Ruby installed. You can use RVM to install and switch versions.

```bash
rvm install 3.0.3
rvm use 3.0.3
```

3. Set up the database:

```bash
rails db:create db:migrate
```

4. Start the server:

```bash
rails s
```

The rails server will be running on `localhost:3000` unless specified otherwise.

### Client

In a separate terminal, make sure you have the Vue CLI installed:

```bash
yarn global add @vue/cli
```

5. Install dependencies:

```bash
cd lettuceMeetApp/client
yarn install
```

6. Start the client server:

```bash
yarn run dev
```

7. Open your browser and navigate to http://localhost:5173 to use the application.

## Docker SetUp
Coming soon...

## Contributing
Coming soon...

## License
Coming soon...
