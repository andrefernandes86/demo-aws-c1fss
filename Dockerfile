FROM ubuntu
RUN apt-get update -y
RUN apt-get install wget curl awscli -y
COPY c1fss-aws.sh ./c1fss-aws.sh
COPY cmd.sh ./cmd.sh
ENTRYPOINT ["sh", "./cmd.sh"]
