FROM registry.opensuse.org/opensuse/leap:15.1
MAINTAINER "alex.arnoldy@suse.com"

RUN zypper --non-interactive refs && zypper --non-interactive refresh && zypper --non-interactive install chrony
COPY ./chrony.conf /etc/chrony.conf

USER 0
CMD ["/usr/sbin/chronyd", "-d"] 

