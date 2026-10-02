FROM nginx:1.25-alpine
MAINTAINER monu
LABEL This is a food delivery app
EXPOSE 80
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/
RUN chown -R nginx:nginx /usr/share/nginx/html/
USER nginx
CMD ["nginx", "-g", "daemon off;"]
