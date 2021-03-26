FROM ruby:3.0.0-alpine3.13
RUN apk add --no-cache --update bash \
    build-base \
    nodejs \
    postgresql-dev \
    curl \
    yarn \
    tzdata \
    imagemagick \
    less \
    vim \
    git

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV LOG_TO_STDOUT true

RUN mkdir /sportnacja
WORKDIR /sportnacja
COPY Gemfile /sportnacja/Gemfile
COPY Gemfile.lock /sportnacja/Gemfile.lock
RUN bundle install --without development test

COPY . /sportnacja
COPY ./docker_rails_env/entrypoint.sh /usr/bin/

RUN yarn install --check-files

RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
