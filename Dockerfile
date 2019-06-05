FROM ruby:latest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# via http://jaredmarkell.com/docker-and-locales/
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /usr/src/app
VOLUME /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["make", "style", "build"]