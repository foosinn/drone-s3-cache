FROM alpine:3.6 as alpine
RUN apk add -U --no-cache ca-certificates

FROM scratch
MAINTAINER Drone.IO Community <drone-dev@googlegroups.com>

ENV GODEBUG=netdns=go

COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

LABEL org.label-schema.version=latest
LABEL org.label-schema.vcs-url="https://github.com/drone-plugins/drone-s3-cache.git"
LABEL org.label-schema.name="Drone S3 Cache"
LABEL org.label-schema.vendor="Drone.IO Community"
LABEL org.label-schema.schema-version="1.0"

ADD release/linux/amd64/drone-s3-cache /bin/
ENTRYPOINT [ "/bin/drone-s3-cache" ]
