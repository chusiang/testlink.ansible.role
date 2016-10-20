Ansible Role: TestLink
=========

[![Build Status](https://travis-ci.org/chusiang/testlink.ansible.role.svg?branch=master)](https://travis-ci.org/chusiang/testlink.ansible.role) [![Ansible Galaxy](https://img.shields.io/badge/role-testlink-blue.svg)](https://galaxy.ansible.com/chusiang/testlink/) [![Docker Hub](https://img.shields.io/badge/docker-testlink-blue.svg)](https://hub.docker.com/r/chusiang/testlink/)

An Ansible role of Deploy TestLink with Nginx, PHP 7 (php-fpm) and MariaDB on Ubuntu.

- Current version:
 - TestLink: **1.9.15**
 - Nginx: **1.10.2**
 - PHP: **7.0.12**
 - MariaDB: **5.5.52**

Requirements
------------

[TO FIX]

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

[TO FIX]

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

- [williamyeh.nginx](https://galaxy.ansible.com/williamyeh/nginx/)
- [chusiang.php7](https://galaxy.ansible.com/chusiang/php7/)
- [geerlingguy.mysql](https://galaxy.ansible.com/geerlingguy/mysql/)

> By the way, if you need to switch apt mirror, you can use [chusiang.switch-apt-mirror](https://galaxy.ansible.com/chusiang/switch-apt-mirror) role.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: chusiang.testlink }

## License

Copyright (c) chusiang from 2016 under the MIT license.