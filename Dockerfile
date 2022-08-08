FROM ruby:3.0.3-alpine AS ruby_builder

# Install build dependencies
RUN apk add --no-cache postgresql-dev && \
    apk add --no-cache --virtual build-deps alpine-sdk npm tzdata

# Set working directory
RUN mkdir /lettuceMeetApp
WORKDIR /lettuceMeetApp

COPY . /lettuceMeetApp/

# Install the website dependencies
ENV BUNDLE_PATH /gems
RUN gem install bundler && bundle install

# Run bundler audit
RUN bundle exec bundle audit update && bundle exec bundle audit check

#Copy the code, test the app, and build the assets pipeline
COPY . /lettuceMeetApp

# Clean up from the build
RUN rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

FROM ruby:3.0.3-alpine

# Install app dependencies
RUN apk add --no-cache postgresql-client

# Set working directory
RUN mkdir /lettuceMeetApp
WORKDIR /lettuceMeetApp

# Copy compiled Ruby App
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=ruby_builder /lettuceMeetApp /lettuceMeetApp

# Declare the entrypoint shell script
RUN chmod 555 /lettuceMeetApp/docker/entrypoint.sh
ENTRYPOINT ["/lettuceMeetApp/docker/entrypoint.sh"]

# Default to running the rails server
CMD ["lettuceMeetApp"]
