FROM ubuntu:precise
MAINTAINER Tommy Lynge Jørgensen <tlyngej@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -yq python-software-properties
RUN add-apt-repository -y ppa:ondrej/php5-oldstable
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php5-xdebug \
        php5-intl \
        php5-sqlite \
        git \
        python \
        graphviz \
        mysql-client \
        msmtp \
        php-apc && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php5/apache2/php.ini
RUN sed -i "s/max_input_time = 60/max_input_time = 600/g" /etc/php5/apache2/php.ini
RUN sed -i "s/memory_limit = 128M/memory_limit = 512M/g" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/g" /etc/php5/apache2/php.ini
RUN sed -i "s/display_errors = Off/display_errors = On/g" /etc/php5/apache2/php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = 2G/g" /etc/php5/apache2/php.ini
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 2G/g" /etc/php5/apache2/php.ini
RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Dublin/g" /etc/php5/apache2/php.ini
RUN sed -i "s/;sendmail_path =/sendmail_path = \"\/usr\/bin\/msmtp -C \/etc\/msmtp --logfile \/var\/log\/msmtp.log -a mail -t\"/g" /etc/php5/apache2/php.ini
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/sites-available/default

# Set Xdebug config
RUN echo "xdebug.remote_enable=1" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.remote_handler=dbgp" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.remote_mode=req" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.remote_host=127.0.0.1" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.profiler_enable = 0" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.profiler_output_name = xdebug.out.%t" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.profiler_output_dir = /tmp" >> /etc/php5/conf.d/xdebug.ini
RUN echo "xdebug.profiler_enable_trigger = 1" >> /etc/php5/conf.d/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite

# Add image configuration and scripts
ADD msmtp /etc/msmtp
RUN chmod 600 /etc/msmtp
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www && ln -s /app /var/www
VOLUME ["/app"]

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
