FROM       daocloud.io/library/ubuntu:latest
MAINTAINER xiongjun,dockerxman <fenyunxx@163.com>

ADD sources.list /etc/apt/sources.list

RUN apt-get update

# install and configure nginx
RUN apt-get install -y nginx
RUN mkdir /var/www

# install some convenience tools
RUN apt-get install -y vim unzip wget curl rsync mysql-client


# install and configure php-fpm
RUN apt-get install -y php5-fpm php5-mysql php5-curl php5-mcrypt php5-gd php5-intl php-pear php5-imagick php5-imap php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl 


# install sshd
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd 
# to get access mount with -v authorized_keys from the host system

# install supervisord
RUN apt-get install -y supervisor

ADD configs /configs

RUN ln -sf /configs/nginx/nginx.conf /etc/nginx/nginx.conf
RUN ln -sf /configs/nginx/sites-available/default /etc/nginx/sites-available/default

RUN ln -sf /configs/supervisor/supervisord.conf /etc/supervisor/
RUN ln -sf /configs/supervisor/conf.d/apps.conf /etc/supervisor/conf.d/apps.conf
RUN ln -sf /configs/php5/php.ini /etc/php5/fpm/php.ini
RUN ln -sf /configs/php5/php-fpm.conf /etc/php5/fpm/php-fpm.conf
RUN ln -sf /configs/php5/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf


# install a site
ADD configs/www /var/www

RUN chown -R www-data:www-data /var/www

EXPOSE 22 80 443
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

