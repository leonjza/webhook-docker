FROM golang:1.20-alpine as build

RUN apk add --update --no-cache curl git
RUN git clone https://github.com/adnanh/webhook.git && \
	cd webhook && \
	go build -o /webhook

FROM alpine:3

COPY --from=build /webhook /webhook
RUN apk add --update --no-cache curl tini

WORKDIR /etc/webhook
EXPOSE 9000

ENTRYPOINT ["/sbin/tini", "--", "/webhook"]
CMD ["-verbose", "-hotreload", "-hooks=hooks.yml"]

