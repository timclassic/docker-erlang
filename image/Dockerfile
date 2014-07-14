FROM stoo/baseimage:0.9.12

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl

# Install additional packages
RUN apt-get install -y less
RUN apt-get install -y man
RUN apt-get install -y unixodbc
RUN apt-get install -y libssl1.0.0
#RUN apt-get install -y libwxgtk2.8-0

# Install package and add to PATH
ADD erlang-17.1.tar.gz /
RUN ln -s erlang-17.1 /opt/erlang
ENV PATH /opt/erlang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Run a shell by default
CMD ["/bin/bash"]
