FROM ubuntu
RUN apt-get update && apt-get install unzip -y
RUN pip3 install boto3
RUN rm -rf /var/www/html/*
RUN mkdir /var/www/html/app1
WORKDIR /var/www/html/app1
COPY . /var/www/html/app1
COPY ./envs/.dev-env  /var/www/html/app1/.env
RUN chmod 777 -R  /var/www/html/app1/bootstrap/cache
RUN rm -rf /etc/apache2/sites-available/000-default.conf
RUN cp -R /var/www/html/app1/python-script/* /scripts
ADD crontab /etc/cron.d/cron-script
RUN crontab /etc/cron.d/cron-script
ADD service.sh /
RUN composer install
#RUN chmod 777 /var/www/html/app1/storage/logs/laravel.log
CMD ["/bin/bash", "/service.sh"]
