# syntax=docker/dockerfile:1

FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx
COPY ./html /usr/share/nginx/html 
COPY nginx.conf /etc/nginx
EXPOSE 80
