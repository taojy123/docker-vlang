FROM debian:stretch-slim

LABEL maintainer="thome <taojy123@163.com>"

# RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
#     echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list

RUN apt update

RUN apt update && \
    apt install -y --no-install-recommends gcc clang make && \
    apt install -y --no-install-recommends git && \
    apt install -y --no-install-recommends libglfw3 libglfw3-dev libfreetype6-dev libssl-dev && \
    apt install -y --no-install-recommends openssl ca-certificates && \
    apt clean && \
    rm -rf /var/cache/apt/archives/* && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/vlang
RUN git clone https://github.com/vlang/v -b 0.1.27

WORKDIR /opt/vlang/v
RUN make
RUN ln -s /opt/vlang/v/v /usr/local/bin/v

CMD ["v"]
