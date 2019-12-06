FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev sqlite-dev
RUN gem install bundler -v 2.0.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

ENV RAILS_LOG_TO_STDOUT true
LABEL maintainer="Justin Culbertson"

CMD puma -C config/puma.rb
