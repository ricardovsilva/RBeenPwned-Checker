FROM ruby:2.7.2-alpine3.13

RUN apk add --no-cache --quiet \
  build-base

RUN gem update --system
RUN gem install bundler

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle update --bundler
RUN bundle

COPY check.rb .

ENTRYPOINT ["ruby", "-W0", "check.rb"]
