FROM nginx:1.25-alpine
MAINTAINER monu
LABEL This is a food delivery app
EXPOSE 80
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/
COPY dist/ /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
RUN addgroup -S nginx-group && adduser -S nginx-user -G nginx-group \
&& chown -R nginx-user:nginx-group /var/cache/nginx /var/log/nginx /etc/nginx \
&& touch /var/run/nginx.pid \
&& chown nginx-user:nginx-group /var/run/nginx.pid
RUN chown -R nginx:nginx /usr/share/nginx/html/
USER nginx
CMD ["nginx", "-g", "daemon off;"]
