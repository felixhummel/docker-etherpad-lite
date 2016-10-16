FROM node

# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md
RUN groupadd -r app && useradd -r -g app app

ADD etherpad-lite/ /home/app/etherpad-lite
RUN chown -R app:app /home/app/

USER app
WORKDIR /home/app
WORKDIR /home/app/etherpad-lite
RUN ./bin/installDeps.sh

CMD ./bin/run.sh
