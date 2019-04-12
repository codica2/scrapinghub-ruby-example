FROM ruby:2.5.1-stretch
ENV LANG=C.UTF-8

RUN apt-get update

COPY . /app

WORKDIR /app

RUN bundle install
RUN ln -sfT /app/shub-image-info.rb /usr/sbin/shub-image-info && \
    ln -sfT /app/crawler.rb /usr/sbin/start-crawl

RUN chmod +x /app/shub-image-info.rb /app/crawler.rb

CMD /bin/bash
