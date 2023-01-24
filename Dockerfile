FROM bitnami/matomo

### Change user to perform privileged actions
USER 0

### Install 'vim'
RUN install_packages vim 
RUN install_packages autoconf gcc g++ make && pecl install redis 

RUN sed -i -r 's/#LoadModule ratelimit_module/LoadModule ratelimit_module/' /opt/bitnami/apache/conf/httpd.conf
RUN echo 'LoadModule redis' >> /opt/bitnami/apache/conf/httpd.conf
### Revert to the original non-root user
USER 1001

### Modify the ports used by Apache by default
## It is also possible to change these environment variables at runtime
#ENV APACHE_HTTP_PORT_NUMBER=8181
#ENV APACHE_HTTPS_PORT_NUMBER=8143
#EXPOSE 8181 8143
