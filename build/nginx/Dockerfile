
FROM busybox as builder

ENV LUNA_VERSION 1.5.4

RUN wget https://github.com/jumpserver/luna/releases/download/${LUNA_VERSION}/luna.tar.gz

RUN tar xf luna.tar.gz

FROM nginx:1.15.5-alpine

COPY --from=builder luna /opt/luna
