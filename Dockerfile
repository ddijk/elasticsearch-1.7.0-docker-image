FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

#RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2


RUN apt-get update && apt-get install -y software-properties-common \
       && apt-get update && apt-get install -y gnupg2 && apt-get install -y wget \
       && wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
       && add-apt-repository -y https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
       && apt-get update \ 
       && apt-get install -y adoptopenjdk-8-hotspot  

COPY ./install.sh /
RUN chmod +x /install.sh

WORKDIR /app
COPY ./elasticsearch-1.7.0.deb .

RUN /install.sh

COPY logging.yml /usr/share/elasticsearch/config/
COPY elasticsearch.yml /usr/share/elasticsearch/config/


ENV PATH=$PATH:/usr/share/elasticsearch/bin

# CMD ["/bin/bash"]
CMD ["elasticsearch"]

EXPOSE 9200 9300