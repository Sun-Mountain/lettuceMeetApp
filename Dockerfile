FROM ruby:3.1.0-alpine AS ruby_builder

# Install build dependencies
RUN apk add --no-cache postgresql-dev && \
    apk add --no-cache libsodium-dev && \
    apk add --no-cache shared-mime-info && \
    apk add --no-cache --virtual build-deps alpine-sdk yarn tzdata

WORKDIR /lettuce-meet-app

# Copy over the files needed to fetch dependencies
COPY ./Gemfile /lettuce-meet-app/
COPY ./Gemfile.lock /lettuce-meet-app/

# Install the website dependencies
RUN gem install bundler --no-document && bundle install && yarn install

# Run bundler audit
RUN bundle exec bundle audit update && bundle exec bundle audit check

# Copy the code, test the app, and build the assets pipeline
COPY . /lettuce-meet-app/

# Clean up from the build
RUN rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

FROM ruby:3.1.0-alpine

# Install app dependencies
RUN apk add --no-cache postgresql-client nodejs tzdata libsodium-dev

# Set the working directory
RUN mkdir /lettuce-meet-app
WORKDIR /lettuce-meet-app

# Copy the compiled Ruby app
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=ruby_builder /lettuce-meet-app /lettuce-meet-app

# Copy the compiled Ruby app
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=ruby_builder /lettuce-meet-app /lettuce-meet-app

# Declare the entrypoint shell script
RUN chmod 555 ./docker/entrypoint.sh
ENTRYPOINT ["./docker/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
