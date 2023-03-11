FROM centos:7.9.2009
WORKDIR /etc/yum.repos.d
ADD CentOS-Base.repo .

RUN cat /etc/yum.repos.d/CentOS-Base.repo && /usr/bin/yum clean all && /usr/bin/yum makecache
RUN /usr/bin/rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN /usr/bin/yum install -y wget yum-utils createrepo  make cmake gcc gcc-c++ pcre-devel zlib-devel \
    openssl openssl-devel net-tools vim nginx yum-plugin-downloadonly rsync && \
	/usr/bin/yum clean all

ENV mirror_nignx_conf_dir	/etc/nginx/conf.d
ENV mirror_nignx_data_dir	/usr/share/nginx/html/mirrors
ENV mirror_centosplus 		$mirror_nignx_data_dir/centos/7/centosplus/x86_64/
ENV mirror_extras 			$mirror_nignx_data_dir/centos/7/extras/x86_64/
ENV mirror_os 				$mirror_nignx_data_dir/centos/7/os/x86_64/
ENV mirror_updates 			$mirror_nignx_data_dir/centos/7/updates/x86_64/
ENV mirror_kubernetes 		$mirror_nignx_data_dir/centos/7/kubernetes/x86_64/

RUN mkdir -p $mirror_centosplus/Packages/ && \
	mkdir -p $mirror_extras/Packages/ && \ 	
	mkdir -p $mirror_os/Packages/ && \ 		
	mkdir -p $mirror_updates/Packages/ && \ 	
	mkdir -p $mirror_kubernetes/Packages/ && \
	/usr/bin/createrepo  $mirror_centosplus && \
	/usr/bin/createrepo  $mirror_extras && \
	/usr/bin/createrepo  $mirror_os && \
	/usr/bin/createrepo  $mirror_updates && \ 	
	/usr/bin/createrepo  $mirror_kubernetes

WORKDIR $mirror_nignx_conf_dir
ADD default.conf .

WORKDIR $mirror_nignx_data_dir
ADD mirrors.repo .
ADD update_repo_yum_tsinghua.sh .

EXPOSE 80
CMD echo "port 80 workdir /var/www/html/mirrors"
CMD ["nginx","-g","daemon off;"]
