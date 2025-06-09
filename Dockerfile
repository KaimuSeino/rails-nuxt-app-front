FROM node:22.16.0-alpine

ARG WORKDIR
ARG API_URL

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    # Bind the container's Nuxt.js to ip:0.0.0.0 in order to run it from the browser
    # https://nuxt.com/docs/api/commands/dev
    HOST=0.0.0.0 \
    # API_URL: URL of the API server
    API_URL=${API_URL}

WORKDIR ${HOME}

# コンテナにパッケージをインストール
COPY package*.json ./
RUN yarn install

# コンテナにNuxtjsプロジェクトをコピー
COPY . ./

# 本番環境でのビルド
RUN yarn run build
