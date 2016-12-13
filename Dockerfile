FROM node

RUN apt-get update && apt-get -y install postgresql-client && rm -rf /var/lib/apt/lists/*

# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md
RUN groupadd -r app && useradd -r -g app app

ADD etherpad-lite/ /home/app/etherpad-lite
RUN chown -R app:app /home/app/

USER app
WORKDIR /home/app
WORKDIR /home/app/etherpad-lite
RUN ./bin/installDeps.sh

COPY entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9001
CMD ./bin/run.sh
