FROM registry.opensuse.org/opensuse/leap:15.1
MAINTAINER "alex.arnoldy@suse.com"

RUN zypper --non-interactive refs && zypper --non-interactive refresh && zypper --non-interactive install chrony
COPY ./chrony.conf /etc/chrony.conf
COPY ./start-chrony.sh /start-chrony.sh


USER 0
# Had lots of problems with chronyd refusing to start after system reboot due to the presence of a PID file
# PID file doesn't make much sense in the case of a container so script just removes it before starting chronyd
CMD ["/start-chrony.sh"]

