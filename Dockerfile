FROM klakegg/hugo:alpine-onbuild AS hugo

ENV HUGO_ENV="production"

RUN set -eu \
  && hugo new site /src --force

COPY config.toml /src/config.toml
COPY themes /src/themes
COPY assets /src/assets

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
