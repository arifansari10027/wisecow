FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    ln -s /usr/games/fortune /usr/bin/fortune && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

ENV SRVPORT=4499
EXPOSE 4499

CMD ["./wisecow.sh"]