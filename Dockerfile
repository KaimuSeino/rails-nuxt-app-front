FROM node:22.16.0-alpine

ARG WORKDIR

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    # Bind the container's Nuxt.js to ip:0.0.0.0 in order to run it from the browser
    # https://nuxt.com/docs/api/commands/dev
    HOST=0.0.0.0

WORKDIR ${HOME}
