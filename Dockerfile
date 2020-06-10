FROM centos:8

LABEL maintainer="taojy123 <taojy123@163.com>"


RUN yum install -y gcc clang make git openssl ca-certificates
# RUN yum groupinstall -y "Development Tools"

WORKDIR /opt/vlang
# RUN git clone https://github.com/vlang/v -b 0.1.27
RUN git clone https://github.com/vlang/v  && cd v && git checkout e38a221d

WORKDIR /opt/vlang/v
RUN make
RUN ./v symlink

CMD ["v"]
