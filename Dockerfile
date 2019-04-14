FROM ruby:2.6.1

WORKDIR /usr/src/app/

COPY Gemfile Gemfile.lock ./

ENV BUNDLE_FROZEN=true
ENV PORT=80

RUN gem install bundler && bundle install

COPY . .

CMD ["ruby", "./translate.rb"]