FROM node:8-alpine

# Installing python and pip as the latter is the documented way to install the
# AWS CLI.
ENV AWSCLI_VERSION "1.16.96"
ENV PACKAGES "gettext curl openssl ca-certificates groff less python py-pip jq git bash"
ENV SERVERLESS_VERSION "1.36.3"
ENV SERVERLESS_OFFLINE_VERSION "4.2.1"

RUN apk add --update $PACKAGES \
    && pip install awscli==$AWSCLI_VERSION \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

# Install serverless.
RUN npm install -g serverless@$SERVERLESS_VERSION \
    npm install -g serverless-offline@$SERVERLESS_OFFLINE_VERSION

EXPOSE 4000

# For efficient layer of node modules
COPY ./package.json /usr/src/app/package.json
WORKDIR /usr/src/app
RUN npm install


COPY ./ /usr/src/app

ENTRYPOINT ["npm"]

CMD ["start"]