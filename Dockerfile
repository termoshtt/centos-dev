FROM centos:7
RUN yum install -y \
  file \
  gcc \
  gcc-c++ \
  kernel-devel \
  make \
  rsync \
  ruby \
  subversion \
  unzip \
  wget \
  which \
  && rm -rf /var/cache/yum/* \
  && yum clean all
WORKDIR /src
RUN wget -q https://cmake.org/files/v3.11/cmake-3.11.1-Linux-x86_64.tar.gz \
  && tar xf cmake-3.11.1-Linux-x86_64.tar.gz \
  && cp -r ./cmake-3.11.1-Linux-x86_64/* /usr/ \
  && rm -rf ./cmake-3.11.1-Linux-x86_64*
RUN wget -q https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz \
  && tar xf boost_1_67_0.tar.gz \
  && pushd boost_1_67_0 \
  && ./bootstrap.sh \
  && ./b2 install -j4 --prefix=/usr \
  && popd
  && rm -rf boost*
