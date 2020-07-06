FROM nginx:alpine
COPY . /usr/share/nginx/html
docker run -d -p 80:80 webserver-image:v1