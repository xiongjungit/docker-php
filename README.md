# NginX - PHP-fpm 

这是一个基础的nginx和php-fpm的docker镜像。

![](https://dn-daoweb-resource.qbox.me/image-icon/nginx.svg)

![](https://dn-daoweb-resource.qbox.me/image-icon/php.svg)

## 组件

* nginx

* php

* openssh-server

## 特点:
* 所有配置文件都从`/configs`做软链接, 从而测试/优化可以挂载文件夹而不是重建图像

* 不包含mysql数据库,需要链接额外的数据库镜像。

## 使用:

建议在使用之前检查所有的配置文件


构建

```
docker build -t dockerxman/docker-php .
```

开发
```    
docker run -i -t \
-v /Volumes/sitename/www/:/var/www \
-v /root/.ssh/authorized_keys:/root/.ssh/authorized_keys \
-v `pwd`/configs/:/configs/ \
-link mariadb:db \
-p 80:80 -p 2222:22 \
dockerxman/docker-php bash
```

正常启动

```
docker run -d \
-v /Volumes/sitename/www/:/var/www \
-v /root/.ssh/authorized_keys:/root/.ssh/authorized_keys \
-link mariadb:db \
-p 80:80 -p 2222:22 \
dockerxman/docker-php bash
```

## 代码创建和维护

* QQ: 479608797

* 邮件: fenyunxx@163.com

* [github](https://github.com/xiongjungit/docker-mysql)

* [dockerhub](https://hub.docker.com/r/dockerxman/)





