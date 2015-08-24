FROM debian:jessie
RUN apt-get update -q -q && apt-get install -y \
  curl \
  locales \
  openssl -qq \
  && locale-gen en_US.UTF-8 en_us \
  && dpkg-reconfigure locales \
  && dpkg-reconfigure locales \
  && locale-gen C.UTF-8 \
  && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
RUN mkdir /service1
RUN mkdir /service2
ADD binary.tar.gz /service1/
COPY binary.tar.gz /service2/
CMD ["/bin/bash", "-c", "tar -xf /service2/binary.tar.gz --directory /service2/ && diff --brief -r /service1 /service2"]
