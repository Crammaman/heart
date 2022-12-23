FROM ruby:3.1.2

ENV PORT 3000

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
        nodejs \
        build-essential \
        git \
	&& rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn

WORKDIR /usr/src/app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

EXPOSE 3000
CMD rails server -b 0.0.0.0 -p $PORT