FROM php:7.2-apache
RUN apt update && apt -y install vim
COPY CU-HWS/ /var/www/html/
COPY settings1.php /var/www/html/
RUN chmod -R 777 /var/www/html/jsondata
