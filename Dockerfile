ARG BUILD_VERSION=0.0.1

FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y gpg wget && \
    wget -O - https://apt.corretto.aws/corretto.key | \gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list && \
    apt-get update && \
    apt-get install -y java-11-amazon-corretto-jdk && \
    apt-get install -y java-17-amazon-corretto-jdk && \
    apt-get install -y java-18-amazon-corretto-jdk && \
    apt-get install -y java-21-amazon-corretto-jdk && \
    apt-get install -y maven && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["bash", "-c"]
