ARG BUILD_VERSION=0.0.1

FROM debian:trixie

RUN apt-get update && \
    apt-get install -y gpg wget

RUN wget -O - https://apt.corretto.aws/corretto.key | \gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list && \
    apt-get update && \
    apt-get install -y java-11-amazon-corretto-jdk && \
    apt-get install -y java-17-amazon-corretto-jdk && \
    apt-get install -y java-18-amazon-corretto-jdk && \
    apt-get install -y java-21-amazon-corretto-jdk

RUn apt-get install -y \
    maven

ENTRYPOINT ["bash", "-c"]
