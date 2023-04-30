FROM debian
RUN apt update -y && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm npm apache2 vim curl git  -y
RUN  npm install -g wstunnel && mkdir /run/sshd && a2enmod proxy && a2enmod proxy_http && a2enmod proxy_wstunnel && a2enmod  rewrite && rm /etc/apache2/sites-available/000-default.conf
COPY ./000-default.conf /etc/apache2/sites-available
RUN curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh

RUN echo 'hello' >/var/www/html/index.html && echo 'wstunnel -s 0.0.0.0:8989 & ' >>/micpeng.sh && echo 'service apache2 restart' >>/micpeng.sh && echo '/usr/sbin/sshd -D' >>/micpeng.sh && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:micpeng365|chpasswd
RUN chmod 755 /micpeng.sh
EXPOSE 80
CMD  /micpeng.sh
