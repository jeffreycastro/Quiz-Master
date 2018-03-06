FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y \ 
  build-essential \
  libpq-dev \
  nodejs

RUN mkdir /quizmaster
WORKDIR /quizmaster

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . /quizmaster

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]