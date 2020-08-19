FROM ruby:2.7.1-alpine3.12
RUN apk add --no-cache --update bash \
    build-base \
    nodejs \
    postgresql-dev \
    curl \
    yarn \
    tzdata \
    imagemagick \
    less \
    vim

RUN mkdir /sportnacja
WORKDIR /sportnacja
COPY Gemfile /sportnacja/Gemfile
COPY Gemfile.lock /sportnacja/Gemfile.lock
RUN bundle install

COPY . /sportnacja

# Add a script to be executed every time the container starts.
COPY ./docker_rails_env/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
