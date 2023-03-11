FROM centos:7.9.2009
WORKDIR /etc/yum.repos.d
ADD CentOS-Base.repo .
RUN cat /etc/yum.repos.d/CentOS-Base.repo && /usr/bin/yum clean all && /usr/bin/yum makecache
RUN /usr/bin/rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN /usr/bin/yum install -y wget yum-utils createrepo  make cmake gcc gcc-c++ pcre-devel zlib-devel \
    openssl openssl-devel net-tools vim nginx yum-plugin-downloadonly rsync && \
	/usr/bin/yum clean all 
RUN /usr/bin/mkdir -p /usr/share/nginx/html/mirrors/centos && /usr/bin/createrepo /usr/share/nginx/html/mirrors/centos
WORKDIR /etc/nginx/conf.d
ADD default.conf .
WORKDIR /usr/share/nginx/html/mirrors
ADD mirrors.repo .
ADD update_repo_yum_tsinghua.sh .
EXPOSE 80
CMD echo "port 80 workdir /var/www/html/mirrors"
CMD ["nginx","-g","daemon off;"]
