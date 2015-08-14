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
RUN mkdir /app
ADD ./dummy_phoenix_app.tar.gz /app/
CMD ["/bin/bash", "-c", "cd /app && ./bin/dummy_phoenix_app foreground"]
