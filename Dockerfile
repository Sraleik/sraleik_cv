FROM k0st/alpine-apache-php
MAINTAINER Sraleik <sraleik@gmail.com>

#RUN apk add --update curl \
#    apache2 && \
#    rm -rf /var/cache/apk/*

#RUN rm -rf /usr/local/apache2/htdocs/
COPY . /app
COPY scripts/run.sh /scripts/run.sh

#COPY docker_test.sh /test/docker_test.sh

#RUN sed -i "s/AllowOverride None/AllowOverride All/g" /usr/local/apache2/conf/httpd.conf && \
RUN  sed -i "s/#ServerName www.example.com:80/ServerName nicolas-rotier.com/g" /etc/apache2/httpd.conf
#    echo "AccessFileName .htaccess" >> /usr/local/apache2/conf/httpd.conf

#EXPOSE 80

#ENTRYPOINT ["bash"]

#CMD ["httpd" "-D" "FOREGROUND"]
