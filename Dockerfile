FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN npm install -g yarn
RUN yarn

RUN bundle install

RUN rake db:migrate

ENTRYPOINT ["rails", "server"]
