#!/bin/bash
set -ex

VERSION=$1
ARCH=$2
if [ "$ARCH" == "amd64" ]; then
  ARCH="x86_64"
  URL="https://download.docker.com/linux/static/stable/${ARCH}/docker-${VERSION}.tgz"
  COMPLETION_URL="https://raw.githubusercontent.com/docker/cli/v${VERSION}/contrib/completion/bash/docker"
fi

DEST="./images/10-docker-${VERSION}${SUFFIX}"

mkdir -p $DEST
curl -sL ${URL} | tar xzf - -C $DEST
curl -sL -o $DEST/docker/completion ${COMPLETION_URL} 
mv $DEST/docker $DEST/engine
