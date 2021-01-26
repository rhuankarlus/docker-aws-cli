FROM docker:latest AS base
LABEL maintainer="Rhuan Karlus Silva"
RUN apk --update add python3 py-pip bash
RUN pip install awscli
RUN apk del py-pip
RUN rm -rf /var/cache/apk/*

FROM base
WORKDIR /root/
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''
RUN mkdir .aws
COPY credentials .aws/
COPY config .aws/
COPY start.sh .
RUN chmod +x start.sh
ENTRYPOINT ["/root/start.sh"]
