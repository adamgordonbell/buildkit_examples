FROM moby/buildkit
RUN apk update && apk add curl
WORKDIR /usr/local/share/ca-certificates
COPY mitmproxy.crt mitmproxy.crt
RUN /usr/sbin/update-ca-certificates

 