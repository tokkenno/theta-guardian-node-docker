FROM alpine:3.11

ENV THETA_HOME /app

RUN apk update && apk add --no-cache curl

WORKDIR /app

RUN mkdir /app/bin && mkdir -p /app/guardian_mainnet/node

VOLUME ["/app/guardian_mainnet/node"]

RUN curl -k --output /app/bin/thetacli `curl -k 'https://mainnet-data.thetatoken.org/binary?os=linux&name=thetacli'`
RUN curl -k --output /app/guardian_mainnet/node/config.yaml `curl -k 'https://mainnet-data.thetatoken.org/config?is_guardian=true'`

ADD entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh /app/bin/thetacli

ENTRYPOINT ["/app/entrypoint.sh"]