#!/bin/bash


# Build Docker image for build environment
docker build -t build_env docker/build

# Create binary inside the build environment
docker run \
           -v /tmp:/tmp \
           build_env \
           bash -c "cd /build && git clone https://github.com/jordi-chacon/dummy_phoenix_app.git && cd dummy_phoenix_app && make release && cp rel/dummy_phoenix_app/releases/0.0.1/dummy_phoenix_app.tar.gz /tmp"

#
# Info: Binary should now be created and stored under /tmp
#

# Build application image
cp /tmp/dummy_phoenix_app.tar.gz docker/run
docker build -t dummy_phoenix_app docker/run
rm docker/run/dummy_phoenix_app.tar.gz

# Run application
docker run -d dummy_phoenix_app
