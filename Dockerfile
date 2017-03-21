FROM  registry.gitlab.com/sraleik/php_blank:latest

RUN rm -rf /app/* /app/.git*

WORKDIR /app

RUN git init && git remote add origin git@gitlab.com:Sraleik/sraleik_cv.git && git fetch origin master

RUN git checkout master
RUN php composer.phar update --no-interaction
RUN npm install

ADD run.sh /run.sh

EXPOSE 80

ENTRYPOINT ["bash"]

CMD ["-l", "/run.sh"]
