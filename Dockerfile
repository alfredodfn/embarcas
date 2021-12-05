FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /embarca-s
WORKDIR /embarca-s
ADD Gemfile /embarca-s/Gemfile
ADD Gemfile.lock /embarca-s/Gemfile.lock
RUN bundle install
ADD . /embarca-s
