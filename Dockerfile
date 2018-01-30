FROM docker:latest

ENV HOME /root

WORKDIR $HOME

RUN apk add --update \
    make \
    ca-certificates \
    openssl \
    python \
    curl \
    gettext && \
    rm /var/cache/apk/* && \
    update-ca-certificates

RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    tar zxvf google-cloud-sdk.tar.gz && \
    rm google-cloud-sdk.tar.gz && \
    ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true && \
    google-cloud-sdk/bin/gcloud --quiet components update && \
    google-cloud-sdk/bin/gcloud components install kubectl