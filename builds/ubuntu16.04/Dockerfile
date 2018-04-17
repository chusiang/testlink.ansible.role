# Dockerfile for building image that contains software stack provisioned by Ansible.

FROM williamyeh/ansible:ubuntu16.04-onbuild

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# fix policy-rc.d for Docker
# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

# init
RUN sudo apt-get install -y curl git make ;\
    git clone https://github.com/chusiang/testlink.ansible.role.git ;\
    cd testlink.ansible.role ;\
    make init

ENV PLAYBOOK testlink.ansible.role/setup.yml
RUN ansible-playbook-wrapper
RUN cp run.sh /

EXPOSE 80 443 
VOLUME [ "/data" ]
ENTRYPOINT [ "/run.sh" ]
