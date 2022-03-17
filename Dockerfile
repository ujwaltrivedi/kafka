FROM ubuntu




RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl default-jdk ntp netcat dnsutils jq vim \
 && apt-get purge -y


ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini


WORKDIR /root
RUN curl https://archive.apache.org/dist/kafka/2.5.1/kafka_2.13-2.5.1.tgz --output kafka_2.13-2.5.1.tgz
RUN tar -xvf kafka_2.13-2.5.1.tgz


WORKDIR /root/kafka_2.13-2.5.1/bin

RUN echo "listeners=PLAINTEXT://0.0.0.0:9092" >> ../config/server.properties
RUN echo "advertised.listeners=PLAINTEXT://localhost:9092" >> ../config/server.properties


COPY kafka-run.sh .
RUN chmod +x kafka-run.sh

EXPOSE 29092 9092 2181

ENTRYPOINT ["/tini", "--"]

CMD ["/root/kafka_2.13-2.5.1/bin/kafka-run.sh"]
