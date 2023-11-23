ARG BUILD_VERSION=0.0.1
ARG PLATFORM=arm64

FROM --platform=${PLATFORM} debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y gpg ca-certificates curl wget gnupg && \
    wget -O - https://apt.corretto.aws/corretto.key | \gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y java-11-amazon-corretto-jdk && \
    apt-get install -y java-17-amazon-corretto-jdk && \
    apt-get install -y java-18-amazon-corretto-jdk && \
    apt-get install -y java-21-amazon-corretto-jdk && \
    apt-get install -y maven && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["bash", "-c"]
