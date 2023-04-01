# Etap 1 - budowanie aplikacji
FROM node:alpine AS build

RUN apk add --update curl && \
rm -rf /var/cache/apk/*

ARG VERSION
ENV VERSION=${VERSION}

WORKDIR ./usr/app

COPY ./package.json ./


RUN npm install && \
    npm install --save dotenv && \
    rm -rf /tmp/* && \
    apk add --update curl && \
rm -rf /var/cache/apk/*

COPY ./app.js ./

HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost:8102/ | exit 1
#----------------------------------------------

# Etap 2 - budowanie obrazu końcowego
FROM node:alpine AS app

ARG VERSION
ENV VERSION=${VERSION}

WORKDIR /usr/app

COPY --from=build ./usr/app ./

EXPOSE 8103

CMD ["npm", "start"]

FROM nginx AS nginx  
COPY --from=app /usr/app /usr/share/nginx/html

EXPOSE 8103

HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost:8103/ || exit 1