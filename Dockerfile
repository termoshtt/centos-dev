FROM centos:7
RUN yum install -y file kernel-devel unzip gcc gcc-c++ make cmake subversion \
  && rm -rf /var/cache/yum/* \
  && yum clean all
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly
ENV PATH $PATH:/root/.cargo/bin
RUN rustup component add rustfmt-preview
RUN chown -R root:users /root && chmod -R 770 /root
