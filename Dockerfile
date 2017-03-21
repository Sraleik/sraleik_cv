FROM httpd:2.4.25-alpine
MAINTAINER Sraleik <sraleik@gmail.com>

COPY . /usr/local/apache2/htdocs/

COPY docker_test.sh /test/docker_test.sh

RUN sed -i "s/AllowOverride None/AllowOverride All/g" /usr/local/apache2/conf/httpd.conf && \
    sed -i "s/#ServerName www.example.com:80/ServerName nicolas-rotier.com/g" /usr/local/apache2/conf/httpd.conf && \
    echo "AccessFileName .htaccess" >> /usr/local/apache2/conf/httpd.conf


EXPOSE 80

ENTRYPOINT ["bash"]

CMD ["httpd-foreground"]
