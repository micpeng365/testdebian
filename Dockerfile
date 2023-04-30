FROM debian
RUN apt update -y && apt upgrade -y && mkdir /run/sshd
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm vim curl git nginx -y
RUN echo '/usr/sbin/sshd -D' >>/micpeng.sh && echo '/usr/sbin/nginx' >> /micpeng.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:micpeng365|chpasswd
RUN chmod 755 /micpeng.sh
EXPOSE 80 22 443
CMD  /micpeng.sh
