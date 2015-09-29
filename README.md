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

## 实例

1. db: 
```
docker run -d -p 3306:3306 -v /data/wordpress/db:/var/lib/mysql --name mysql dockerxman/mysql
```
```
========================================================================
You can now connect to this MySQL Server using:

    mysql -uadmin -pWxfLmXP2FFwa -h<host> -P<port>

Please remember to change the above password as soon as possible!
MySQL user 'root' has no password but only allows local connections
========================================================================
```

2. web:
```
docker run -d -p 80:80 -v /data/wordpress/web/wordpress/:/var/www/ --link mysql:db --name wordpress dockerxxman/php 
```

## 代码创建和维护

* QQ: 479608797

* 邮件: fenyunxx@163.com

* [github](https://github.com/xiongjungit/docker-mysql)

* [dockerhub](https://hub.docker.com/r/dockerxman/)





