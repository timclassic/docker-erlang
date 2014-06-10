FROM stoo/baseimage:0.9.9

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl

# Download the Erlang/OTP source
RUN mkdir /buildroot
WORKDIR /buildroot
RUN curl -O http://www.erlang.org/download/otp_src_17.0.tar.gz
RUN curl -O http://www.erlang.org/download/otp_doc_man_17.0.tar.gz
RUN tar zxf otp_src_17.0.tar.gz

# Install additional packages
RUN apt-get install -y less
RUN apt-get install -y man
RUN apt-get install -y build-essential
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libwxgtk2.8-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libglu1-mesa-dev
RUN apt-get install -y xsltproc
RUN apt-get install -y fop
RUN apt-get install -y libxml2-utils
RUN apt-get install -y openjdk-6-jdk
RUN apt-get install -y unixodbc-dev
RUN apt-get install -y autoconf

# Build
WORKDIR otp_src_17.0
RUN ./configure
RUN make -j6

# Install
RUN make RELEASE_ROOT=/opt/erlang-17.0 release
WORKDIR /opt/erlang-17.0
RUN ./Install -minimal /opt/erlang-17.0
RUN tar zxf /buildroot/otp_doc_man_17.0.tar.gz

# Reset working directory
WORKDIR /
