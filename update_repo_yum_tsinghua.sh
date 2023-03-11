#!/bin/bash
update_mirror_nignx_data_dir=/usr/share/nginx/html/mirrors
update_mirror_centosplus=$mirror_nignx_data_dir/centos/7/centosplus/x86_64/Packages/
update_mirror_extras=$mirror_nignx_data_dir/centos/7/extras/x86_64/Packages/
update_mirror_os=$mirror_nignx_data_dir/centos/7/os/x86_64/Packages/
update_mirror_updates=$mirror_nignx_data_dir/centos/7/updates/x86_64/Packages/
update_mirror_kubernetes=$mirror_nignx_data_dir/centos/7/kubernetes/x86_64/Packages/

/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/centosplus/x86_64/Packages/ 			$update_mirror_centosplus
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/extras/x86_64/Packages/ 				$update_mirror_extras
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/os/x86_64/Packages/ 					$update_mirror_os
/usr/bin/rsync -avz rsync://mirrors.tuna.tsinghua.edu.cn/centos/7/updates/x86_64/Packages/ 				$update_mirror_updates
/usr/bin/rsync -avz rsync://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/Packages/ 	$update_mirror_kubernetes

/usr/bin/createrepo --update $update_mirror_centosplus
/usr/bin/createrepo --update $update_mirror_extras
/usr/bin/createrepo --update $update_mirror_os
/usr/bin/createrepo --update $update_mirror_updates
/usr/bin/createrepo --update $update_mirror_kubernetes
