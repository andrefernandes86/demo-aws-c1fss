FROM ubuntu
RUN apt-get update
RUN apt-get install wget curl -y
COPY c1fss-aws.sh ./c1fss-aws.sh
COPY cmd.sh ./cmd.sh
RUN sh ./awscli.sh
ENTRYPOINT ["sh", "./cmd.sh"]
