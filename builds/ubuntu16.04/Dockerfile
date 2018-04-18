# Dockerfile for building image that contains software stack provisioned by Ansible.

FROM williamyeh/ansible:ubuntu16.04-onbuild

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN echo "===> Fix policy-rc.d for Docker ..."                              && \
      sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

RUN echo "===> Install necessary packages ..."                              && \
      apt-get install -y curl git make

RUN echo "===> Get playbook ..."                                            && \
    git clone --depth=1 https://github.com/chusiang/testlink.ansible.role.git ;\
    cd testlink.ansible.role                                                && \
    make init

ENV PLAYBOOK testlink.ansible.role/setup.yml

RUN echo "===> Run playbook ..."                                            && \
      ansible-playbook-wrapper

RUN echo "===> Clean ..."                                                   && \
      apt-get clean                                                         && \
      cd /tmp                                                               && \
      rm -rf Dockerfile run.sh testlink.ansible.role testlink.tar.gz

VOLUME [ "/data" ]
WORKDIR /srv
EXPOSE 80 443

COPY run.sh /
ENTRYPOINT [ "/run.sh" ]
