FROM debian:buster
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get upgrade -y && apt-get -y install nginx && rm -rf /var/lib/apt/lists/*

EXPOSE 80

USER www

CMD ["nginx", "-g", "daemon off;"]

