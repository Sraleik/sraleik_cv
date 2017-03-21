FROM  registry.gitlab.com/sraleik/php_blank:latest

RUN rm -rf /app/* /app/.git*

WORKDIR /app

COPY . /app/
RUN php composer.phar update --no-interaction
RUN npm install

COPY run.sh /run.sh
COPY blank_test.sh /test/blank_test.sh

EXPOSE 80

ENTRYPOINT ["bash"]

CMD ["-l", "/run.sh"]
