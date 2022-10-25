FROM klakegg/hugo:alpine-onbuild AS hugo

ENV HUGO_ENV="production"

FROM nginx:alpine
COPY --from=hugo /target /usr/share/nginx/html/links
