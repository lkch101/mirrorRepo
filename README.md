# mirrorRepo
# docker centos7 repo x86_64
- started
```
# -v $dir:/usr/share/nginx/html/mirrors/centos
/usr/share/nginx/html/mirrors/centos

# expose 80
```
- docker exec && update repo
```
cd /usr/share/nginx/html/mirrors
sh update_repo_yum_tsinghua.sh
```
- client server setting
```
# /usr/share/nginx/html/mirrors
rm -fr /etc/yum.repos.d/*.repo
wget -O /etc/yum.repos.d/mirrors.repo http://nginx:80/mirrors/mirrors.repo

# change info 
vim /etc/yum.repos.d/mirrors.repo
baseurl=http://${192.168.1.1:80}/mirrors/centos/
```

