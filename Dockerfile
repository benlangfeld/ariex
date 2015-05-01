FROM centos:centos6
MAINTAINER Ben Langfeld <ben@langfeld.me>

RUN yum install -y dnsmasq && rpm -Uvh http://packages.asterisk.org/centos/6/current/i386/RPMS/asterisknow-version-3.0.1-2_centos6.noarch.rpm && yum update -y && yum install -y asterisk asterisk-configs --enablerepo=asterisk-13 && yum clean all

ADD asterisk/ari.conf /etc/asterisk/
ADD asterisk/extensions.conf /etc/asterisk/
ADD asterisk/http.conf /etc/asterisk/
ADD asterisk/modules.conf /etc/asterisk/
ADD asterisk/pjsip.conf /etc/asterisk/

CMD asterisk -f
