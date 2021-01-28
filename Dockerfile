FROM alpine:3

LABEL maintainer="Marlon Leerkotte <marlon@leerkotte.net>"

ENV SNMP_UID=51338 \
    SNMP_GID=51338

RUN apk add --no-cache net-snmp-tools shadow \
    && groupadd --gid $SNMP_GID --system snmp \
    && useradd --uid $SNMP_UID --gid $SNMP_GID --system --create-home snmp

WORKDIR /home/snmp

USER snmp

CMD ["sh"]
