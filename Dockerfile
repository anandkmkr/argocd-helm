FROM centos:8

# Use vault.centos.org for EOL CentOS 7
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum -y install epel-release && \
    yum -y install nginx && \
    yum clean all

# Copy configuration and content
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf

# Display the copied file for debugging
RUN cat /usr/share/nginx/html/index.html

# Expose only container port
EXPOSE 8080

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]


#FROM centos
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
#RUN yum -y install epel-release
#RUN yum -y install nginx
#COPY index.html /usr/share/nginx/html/index.html
#COPY nginx.conf /etc/nginx/nginx.conf
#RUN cat /usr/share/nginx/html/index.html
#EXPOSE 8080:8080
#CMD ["nginx", "-g", "daemon off;"]
