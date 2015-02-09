FROM danielfarrell/ruby
MAINTAINER Tommy Jørgensen <tlyngej@gmail.com>

# Install dependencies (sqlite3)
RUN apt-get update; apt-get install -y sqlite3 libsqlite3-dev

# Install Mailcatcher
RUN gem install i18n -v 0.6.11 --no-rdoc --no-ri
RUN gem install mailcatcher --no-rdoc --no-ri

EXPOSE 25
EXPOSE 1080
