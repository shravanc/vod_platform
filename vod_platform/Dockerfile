FROM ruby:2.5.1

ENV BUNDLER_VERSION=2.1.2

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
    qt5-default \
    libqt5webkit5-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

RUN gem install bundler -v 2.1.2

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle check || bundle install

COPY . .

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

