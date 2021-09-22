FROM movesrwth/stormpy:travis

USER root
WORKDIR /

# Set default env values
ENV LICENSE_KEY ""

RUN apt-get update && apt-get -y upgrade

# gui dependencies
RUN apt-get -y install nodejs npm
RUN npm install -g http-server

COPY web_app /opt/web_app

COPY start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080
EXPOSE 5000

CMD ["start.sh"]