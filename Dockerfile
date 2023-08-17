FROM ubuntu:latest
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt -y update
RUN apt install apache2 -y
RUN rm -rf /var/www/html/*
RUN apt install unzip
RUN apt install wget
RUN apt install php -y
RUN apt install php-mysqlnd -y
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN mv wordpress/* /var/www/html/
#RUN cd /var/www/html/wordpress/
RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
RUN sed -i 's/database_name_here/sivadb/g' /var/www/html/wp-config.php
RUN sed -i 's/username_here/sivaraju/g' /var/www/html/wp-config.php
RUN sed -i 's/password_here/12345678/g' /var/www/html/wp-config.php
RUN sed -i 's/localhost/sivadb.c2kilpxc7jb3.us-east-1.rds.amazonaws.com/g' /var/www/html/wp-config.php
EXPOSE 3306
EXPOSE 80
CMD apachectl -D FOREGROUND
