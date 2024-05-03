FROM alpine:latest as builder
ARG ARCH=linux-x64
WORKDIR /tmp/
RUN echo "ARCH=$ARCH" && \
    apk update && \
    apk add curl jq && \
    wget $(curl -s https://api.github.com/repos/klzgrad/naiveproxy/releases | jq -r "[.[0].assets[] | select(.name | contains(\"$ARCH\"))][0].browser_download_url") && \
    tar xf ./naiveproxy-*.tar.xz && \
    cp ./naiveproxy-*/naive ./naive

FROM alpine:latest
COPY --from=builder /tmp/naive /app/
RUN apk update && \
    apk add libc6-compat libgcc
ENTRYPOINT ["/app/naive"]
CMD ["-c", "/app/config.json"]
