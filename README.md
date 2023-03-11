# mirrorRepo
# docker centos7 repo x86_64
- started
```bash
# -v $dir:/usr/share/nginx/html/mirrors/centos

# expose 80
```
- docker exec && update repo
```bash
cd /usr/share/nginx/html/mirrors
sh update_repo_yum_tsinghua.sh
```
- client server setting
```bash
# vim /etc/hosts
echo "192.168.x.x  repo.lkc.local" >> /etc/hosts

# /usr/share/nginx/html/mirrors
rm -fr /etc/yum.repos.d/*.repo
wget -O /etc/yum.repos.d/mirrors.repo http://repo.lkc.local/mirrors/mirrors.repo
```

