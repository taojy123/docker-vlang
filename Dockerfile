FROM centos:8

LABEL maintainer="taojy123 <taojy123@163.com>"

RUN yum update -y
RUN yum install -y gcc clang make git openssl ca-certificates openssl-devel
RUN yum groupinstall -y "Development Tools"

WORKDIR /opt/vlang
RUN git clone https://github.com/vlang/v -b 0.2

WORKDIR /opt/vlang/v
RUN make
RUN ./v symlink

CMD ["v"]
