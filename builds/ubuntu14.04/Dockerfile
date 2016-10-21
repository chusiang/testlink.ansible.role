# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# USAGE:
#   $ docker build -t testlink ../
#   $ docker run -d -v $(pwd):/data testlink
#
# Version  1.1
#

# pull base image
FROM williamyeh/ansible:ubuntu14.04-onbuild

MAINTAINER Chu-Siang Lai <chusiang.lai@gmail.com>


# fix policy-rc.d for Docker
# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

RUN echo "===> Installing curl for testing purpose..."  && \
    DEBIAN_FRONTEND=noninteractive  \
    apt-get install -y -f curl

ENV PLAYBOOK setup.yml
RUN ansible-playbook-wrapper -vvv
RUN cp files/run.sh /

EXPOSE 80 443 
VOLUME [ "/data" ]
ENTRYPOINT [ "/run.sh" ]
