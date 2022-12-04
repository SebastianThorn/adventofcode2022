# Baseimage
FROM ruby:2.7-alpine

# Add user
RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app
USER app

# Working directory
WORKDIR /usr/src/app

# Copy bundler Gemfile for rubygems
COPY --chown=app:app Gemfile Gemfile.lock ./

# Ruby-Gems
RUN bundle lock --update && \
    bundle install --jobs=4

# Copy source-files
COPY --chown=app:app main.rb input input_ex ./

# Send "ctrl-c"-like signal when stopping
STOPSIGNAL SIGINT

# Start main.rb
CMD ["ruby", "main.rb"]
