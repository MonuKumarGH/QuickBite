FROM nginx
MAINTAINER monu
LABEL This is a food delivery app
EXPOSE 80
COPY index.html /usr/share/nginx/html/
