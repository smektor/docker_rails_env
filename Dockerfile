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

RUN mkdir /sportnacja
WORKDIR /sportnacja
COPY Gemfile /sportnacja/Gemfile
COPY Gemfile.lock /sportnacja/Gemfile.lock
RUN bundle install

COPY . /sportnacja
COPY ./docker_rails_env/entrypoint.sh /usr/bin/

RUN yarn install --check-files

RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
