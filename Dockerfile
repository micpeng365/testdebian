FROM debian
RUN apt update -y && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm vim curl git nginx  -y
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:micpeng365|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80 22
CMD  /luo.sh
