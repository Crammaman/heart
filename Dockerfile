FROM ruby:3.1.2
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
        nodejs \
        build-essential \
	&& rm -rf /var/lib/apt/lists/* \
    && node --version  \
    && npm --version

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

RUN bundle exec rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]