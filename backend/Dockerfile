FROM ruby:3.0.2
RUN apt-get update -qq \
  && apt-get install -y \
  && rm -rf /var/lib/apt/lists/* 

ENV TZ=Asia/Tokyo

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3010

CMD ["rails", "server", "-b", "0.0.0.0"]
