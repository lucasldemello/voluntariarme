FROM ruby:3.1.2

RUN apt-get update -y \
 && apt-get install -y -q \
    build-essential \
    ca-certificates \
    libpq-dev \
    default-mysql-client \
    vim \
    htop \
 && apt-get clean \
 && rm -f /var/lib/apt/lists/*_*

RUN mkdir /voluntariarme
WORKDIR /voluntariarme

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install rails bundler

COPY . .

EXPOSE 3000
EXPOSE 3001
EXPOSE 3003
EXPOSE 11211

ENTRYPOINT ["sh", "./entrypoint.sh"]
# ENTRYPOINT ["/bin/bash"]