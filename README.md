# Ansible Role: TestLink

[![Build Status](https://travis-ci.org/chusiang/testlink.ansible.role.svg?branch=master)](https://travis-ci.org/chusiang/testlink.ansible.role) [![Ansible Galaxy](https://img.shields.io/badge/role-testlink-blue.svg)](https://galaxy.ansible.com/chusiang/testlink/) [![Docker Hub](https://img.shields.io/badge/docker-testlink-blue.svg)](https://hub.docker.com/r/chusiang/testlink/) [![](https://images.microbadger.com/badges/image/chusiang/testlink.svg)](https://microbadger.com/images/chusiang/testlink "Get your own image badge on microbadger.com") [![Vagrant](https://img.shields.io/badge/vagrant-testlink-blue.svg)](https://atlas.hashicorp.com/chusiang/boxes/testlink)

An Ansible role of Deploy [TestLink][testlink_website] with Nginx, PHP 7 (php-fpm) and MySQL 5.6 on Ubuntu and Debian.

- Current version on Ubuntu 14.04:
  - TestLink: **1.9.15**
  - Nginx: **1.10.2**
  - PHP: **7.0.12**
  - MySQL: **5.6.33** [^1]

- Current version on Debian 8:
  - TestLink: **1.9.15**
  - Nginx: **1.10.2**
  - PHP: **7.0.12**
  - MySQL: **5.6.34** [^2] 

[testlink_website]: http://www.testlink.org/

## Requirements

If we want to use the TestLink role on debian 8, we need include `tasks/add_mysql_repo.yml` at `pre_tasks` and use different package name.

```
pre_tasks:
  - name: manual add mysql repository
    include: tasks/add_mysql_repo.yml

roles:
  - williamyeh.nginx
  - chusiang.php7
  - {
      role: geerlingguy.mysql,
      mysql_packages: ['mysql-server', 'mysql-client','python-mysqldb'],
      when: "ansible_distribution == 'Debian'"
    }
  - {
      role: geerlingguy.mysql,
      mysql_packages: ['mysql-server-5.6', 'mysql-client-5.6','python-mysqldb'],
      when: "ansible_distribution == 'Ubuntu'"
    }
```

## Role Variables

If you have a stand alone database server, you can setting the `setup_local_database` to `false`, it will not run tasks of install database server.

```
setup_local_database: true

# TestLink
testlink_tarball_version: '1.9.15'
testlink_tarball_url: 'http://downloads.sourceforge.net/project/testlink/TestLink%201.9/TestLink%201.9.15/testlink-1.9.15.tar.gz'
testlink_tarball_md5: 'd5b9a3e93cdfd9c8d9daed7fa4257409'
testlink_var_path: '/var/testlink'
testlink_db_name: 'testlinkdb'
testlink_db_user: 'testlinkdb'
testlink_db_password: 'cUv4UK6ardC6cMGL'
testlink_db_host: 'localhost'

# Nginx
nginx_user: 'www-data'
nginx_testlink_path: '/usr/share/nginx/testlink'
nginx_server_name: 'testlink.example.tw'
nginx_enable_ssl: false

# PHP-FPM
php_owner: '{{ nginx_user }}'
php_group: '{{ nginx_user }}'
php_max_execution_time: '3000'
php_session_gc_maxlifetime: '60000'

# MySQL 5.6.x
#
# - TestLink 1.9.15 need mysql-server 5.6.x
#  - https://github.com/TestLinkOpenSourceTRMS/testlink-code
mysql_root_password: ''
mysql_root_password_update: 'no'
mysql_packages:
  - 'mysql-client-5.6'
  - 'mysql-server-5.6'
  - 'python-mysqldb'
```

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

- [williamyeh.nginx](https://galaxy.ansible.com/williamyeh/nginx/)
- [chusiang.php7](https://galaxy.ansible.com/chusiang/php7/)
- [geerlingguy.mysql](https://galaxy.ansible.com/geerlingguy/mysql/)

> By the way, if you need to switch apt mirror, you can use [chusiang.switch-apt-mirror](https://galaxy.ansible.com/chusiang/switch-apt-mirror) role.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: chusiang.testlink }

## Docker Container

This repository contains Dockerized [Ansible](https://github.com/ansible/ansible), published to the public [Docker Hub](https://hub.docker.com/) via **automated build** mechanism.

> Docker Hub: [chusiang/testlink](https://hub.docker.com/r/chusiang/testlink/)

### Images

- chusiang/testlink (lastest)

### Usage

- Run container.

    ```
    $ docker run --name=testlink -p 8080:80 -d chusiang/testlink
    3bf486c1515b9c28499bbd48f1fe3d3164434108636a49585b1a7b4e3965293e
    ```

- Check container status.

    ```
    $ docker ps
    CONTAINER ID    IMAGE                COMMAND      CREATED           STATUS           PORTS                            NAMES
    3bf486c1515b    chusiang/testlink    "/run.sh"    20 minutes ago    Up 20 minutes    443/tcp, 0.0.0.0:8080->80/tcp    testlink
    ```

- Go TestLink web (http://localhost:8080).

    ![2016-10-22-testlink-login-page](https://cloud.githubusercontent.com/assets/219066/19607220/eab4c16a-97fa-11e6-97e1-04869b724673.png)

- Login the default administrator account, the **name and password are admin / admin**. 


## License

Copyright (c) chusiang from 2016 under the MIT license.


[^1]: The TestLink 1.9.15 is base on **PHP > 5.4** and **MySQL 5.6.x**, please be careful. [(more)](https://github.com/TestLinkOpenSourceTRMS/testlink-code/blob/testlink_1_9/README)

[^2]: It only have **MySQL 5.5.x** by default on Debian 8, so I use the mysql official development repo to over the **MySQL 5.6.x**. [(more)](https://github.com/chusiang/testlink.ansible.role/issues/6) 
