FROM alpine:3.8

ARG ARIA2_VER=1.34.0-r0
ARG ARIANG_LINK=https://github.com/mayswind/AriaNg/releases/download/0.5.0/AriaNg-0.5.0.zip

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-default && \
	mkdir -p /data && \
	apk add --update aria2=${ARIA2_VER} && \
	apk add --update curl && \
	curl -L ${ARIANG_LINK} --output AriaNg.zip && \
	mkdir AriaNg && \
        unzip AriaNg.zip -d AriaNg && \
	rm AriaNg.zip && \
    	apk del curl && \
	apk add --update darkhttpd && \
	rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

ADD default/aria2.conf /conf-default/aria2.conf
ADD default/on-complete.sh /conf-default/on-complete.sh

WORKDIR /

VOLUME ["/data"]
VOLUME ["/conf"]

EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/start.sh"]
