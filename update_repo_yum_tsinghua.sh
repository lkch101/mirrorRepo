#!/bin/bash
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/centosplus/x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/extras/x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/os/x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/updates/x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/epel/7Server/x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
/usr/bin/rsync -avz rsync://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/Packages/ /usr/share/nginx/html/mirrors/centos
#/usr/bin/rsync -avz rsync://download.docker.com/linux/centos/7/x86_64/stable/Packages/ /var/www/html/mirrors/centos

/usr/bin/createrepo --update /var/www/html/mirrors/centos
