FROM ruby:3.1.2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
        nodejs \
        build-essential \
	&& rm -rf /var/lib/apt/lists/* \
    && node --version  \
    && npm --version
RUN npm install -g yarn

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install

# Add a script to be executed every time the container starts.
COPY bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN bundle exec rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]