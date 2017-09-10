FROM node:6

RUN apt-get update && apt-get -y install postgresql-client && rm -rf /var/lib/apt/lists/*

# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md
RUN groupadd --system app \
    && useradd --create-home --system --gid app app

ADD https://github.com/ether/etherpad-lite/archive/1.6.1.tar.gz /tmp/
RUN cd /tmp \
    && tar xf 1.6.1.tar.gz \
    && mv etherpad-lite-1.6.1/ /home/app/etherpad-lite \
    && chown -R app:app /home/app/ \
    && rm /tmp/1.6.1.tar.gz

USER app
WORKDIR /home/app/etherpad-lite
RUN ./bin/installDeps.sh

COPY entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9001
CMD ./bin/run.sh
