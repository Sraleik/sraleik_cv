FROM httpd:2.4.25-alpine
MAINTAINER Sraleik <sraleik@gmail.com>

COPY . /usr/local/apache2/htdocs/

COPY docker_test.sh /test/docker_test.sh

EXPOSE 80

ENTRYPOINT ["bash"]

CMD ["httpd-foreground"]
