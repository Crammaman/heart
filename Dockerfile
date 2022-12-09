FROM ruby:3.1.2
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
        nodejs \
        build-essential \
        yarn \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY ./ ./
RUN bundle install

# Add a script to be executed every time the container starts.
COPY bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN bundle exec rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]