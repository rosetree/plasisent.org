FROM ruby:latest

ARG USER=plasisent
ARG USER_ID=1000
ARG GROUP=${USER}
ARG GROUP_ID=${USER_ID}
ARG WORKDIR=/usr/src/app

RUN groupadd --gid ${GROUP_ID} ${GROUP} \
    && useradd --gid ${GROUP_ID} --home-dir ${WORKDIR} --uid ${USER_ID} ${USER}

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# via http://jaredmarkell.com/docker-and-locales/
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR ${WORKDIR}
VOLUME ${WORKDIR}

COPY Gemfile Gemfile.lock ./
RUN bundle install

USER plasisent

CMD ["make", "style", "build"]