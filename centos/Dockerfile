FROM scratch
ADD resource/centos-base.tar.gz /

RUN dnf install --assumeyes glibc-langpack-en \
 && dnf install --assumeyes epel-release \
 && dnf install --assumeyes dnf-plugins-core \
 && dnf config-manager --set-enabled PowerTools \
 && dnf clean all \
 && rm -rf /var/cache/yum

CMD ["/bin/bash"]
