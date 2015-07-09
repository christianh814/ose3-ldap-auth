#
# This image is to proxy ldap authentication to OpenShift 3
#

#FROM registry.access.redhat.com/rhel

FROM centos:centos7

RUN yum -y  install tar httpd mod_ssl mod_ldap php mod_php && yum -y clean all

ADD auth.conf /etc/httpd/conf.d/zzzzzzz_auth.conf
ADD id.php /var/www/html/id.php
ADD basicauthurl-cert.crt /etc/pki/tls/certs/localhost.crt
ADD basicauthurl-key.key /etc/pki/tls/private/localhost.key 
ADD ca.crt /etc/pki/CA/certs/ca.crt

EXPOSE 443

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
##
##
