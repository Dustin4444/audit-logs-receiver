FROM alpine:latest
RUN apk --update upgrade && apk add ca-certificates
ARG TARGETARCH
COPY collector-config.yaml /etc/otel/config.yaml
COPY castai-collector/castai-collector-$TARGETARCH /castai-collector
ENTRYPOINT ["/castai-collector"]
CMD ["--config", "/etc/otel/config.yaml"]