FROM ruby:3.1.2-alpine AS ruby_builder

# Install build dependencies
RUN apk add --no-cache postgresql-dev && \
    apk add --no-cache libsodium-dev && \
    apk add --no-cache shared-mime-info && \
    apk add --no-cache --virtual build-deps alpine-sdk yarn tzdata && \
    apk add --no-cache gcompat

WORKDIR /lettuce-meet-api

# Copy over the files needed to fetch dependencies
COPY ./Gemfile /lettuce-meet-api/
COPY ./Gemfile.lock /lettuce-meet-api/

# Copy the code, test the app, and build the assets pipeline
COPY . /lettuce-meet-api/

# Install the website dependencies
RUN gem install bundler --no-document && bundle update --bundler && bundle install && yarn install

# Run bundler audit
RUN bundle audit check --update

# Clean up from the build
RUN rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

FROM ruby:3.1.2-alpine AS ruby_server

# Install app dependencies
RUN apk add --no-cache postgresql-client nodejs tzdata libsodium-dev

# Set the working directory
RUN mkdir /lettuce-meet-api
WORKDIR /lettuce-meet-api

# Copy the compiled Ruby app
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=ruby_builder /lettuce-meet-api /lettuce-meet-api

# Copy the compiled Ruby app
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=ruby_builder /lettuce-meet-api /lettuce-meet-api

# Declare the entrypoint shell script
RUN chmod 555 /lettuce-meet-api/docker/entrypoint.sh
ENTRYPOINT ["/lettuce-meet-api/docker/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
