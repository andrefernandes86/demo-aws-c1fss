FROM ubuntu
RUN apt-get update
RUN apt-get install wget python python3 unzip curl -y
COPY c1fss-aws.sh ./c1fss-aws.sh
COPY cmd.sh ./cmd.sh
COPY awscli.sh ./awscli.sh
RUN sh ./awscli.sh
ENTRYPOINT ["sh", "./cmd.sh"]
