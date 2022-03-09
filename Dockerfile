FROM ubuntu:20.04

MAINTAINER Rafshanzani Suhada <rafsanzani.suhada99@gmail.com>

RUN apt-get update && apt-get install openssh-server curl -y

RUN mkdir /var/run/sshd
RUN sed -i s/#PermitRootLogin\ prohibit-password/PermitRootLogin\ yes/g  /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd

COPY ./ssh-log.sh /etc/profile.d/ssh-log.sh

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
