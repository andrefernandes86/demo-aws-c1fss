FROM ubuntu
RUN apt-get update
RUN apt-get install wget python unzip curl awscli -y
COPY c1fss-aws.sh ./c1fss-aws.sh
COPY cmd.sh ./cmd.sh
ENTRYPOINT ["sh", "./cmd.sh"]
