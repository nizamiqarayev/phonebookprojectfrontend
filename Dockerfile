FROM node:15.13-alpine as build
WORKDIR /pbfront
ENV /pbfront/.bin .
VOLUME /tmp
ARG REACT_APP_BACKEND_DOMAIN
ENV REACT_APP_BACKEND_DOMAIN ${REACT_APP_BACKEND_DOMAIN}
ARG REACT_APP_BACKEND_PORT
ENV REACT_APP_BACKEND_PORT ${REACT_APP_BACKEND_PORT}
ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL http://${BACKENDSVC_SERVICE_HOST}:${BACKENDSVC_SERVICE_PORT}
EXPOSE 3000
COPY . .
RUN npm install
RUN npm run build
ENTRYPOINT [ "npm","start" ]