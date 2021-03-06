FROM centos:7
MAINTAINER uhitzel@axway.com

EXPOSE 443

# these are still hardcoded in the expect script
ARG mysql_table=portal
ARG mysql_host=172.17.0.1
ARG mysql_port=3306
ARG mysql_user=root
ARG mysql_pw=axway

RUN yum update -y
RUN yum -y install mysql

RUN yum -y install epel-release
RUN yum -y install php-mcrypt php-devel wget expect gcc

COPY APIPortal_7.5.5_Install_RHEL7_linux-x86-64_BN126.tgz /tmp
RUN tar -xvzf /tmp/APIPortal_7.5.5_Install_RHEL7_linux-x86-64_BN126.tgz
RUN wget -O /tmp/phpredis.tgz https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz
RUN tar -xvzf /tmp/APIPortal_7.5.5_Install_RHEL7_linux-x86-64_BN126.tgz -C /tmp

RUN yum -y install sudo
RUN adduser portal

#COPY sudo /usr/bin
#RUN chmod a+x /usr/bin/sudo

RUN echo $mysql_table > /tmp/tables.txt
COPY installer-wrapper.x /tmp
RUN chmod a+x /tmp/installer-wrapper.x
COPY installer-wrapper.sh /tmp
RUN chmod a+x /tmp/installer-wrapper.sh
RUN /tmp/installer-wrapper.sh

COPY portal-wrapper.sh /
RUN chmod a+x /portal-wrapper.sh
RUN chown -R portal:portal /run/httpd
RUN chmod -R a+rwx /var/log
RUN chown portal:portal /etc/httpd/conf/server.key
RUN chown portal:portal /etc/httpd/conf/server.crt
RUN chown portal:portal /etc/pki/tls/private/localhost.key
RUN chown portal:portal /etc/pki/tls/certs/localhost.crt

USER portal
CMD ["/portal-wrapper.sh",""]
