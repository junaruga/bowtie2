FROM multiarch/ubuntu-debootstrap:arm64-bionic
RUN uname -a
RUN apt-get update -qq && \
  apt-get install -yq --no-install-suggests --no-install-recommends \
  ca-certificates \
  gcc \
  g++ \
  make \
  software-properties-common \
  zlib1g-dev
RUN add-apt-repository -y universe && \
  apt-get update -qq && \
  apt-get install -yq \
  libtbb-dev \
  clang \
  clang++
WORKDIR /build
COPY . .
CMD exec bash -c "make allall && make simple-test"
