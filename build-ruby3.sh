#!/bin/bash
BUILDS_DIR="builds"
mkdir -p $BUILDS_DIR
VERSION="3.4.7"
docker build -t ruby-builder \
    --build-arg USERNAME=$(whoami) \
    --build-arg USER_UID=1001 \
    --build-arg USER_GID=1001 \
    --build-arg VERSION=$VERSION 3.4/.
rm -f $BUILDS_DIR/ruby-$VERSION.tar.gz
docker run --rm ruby-builder cat /ruby-$VERSION.tar.gz > $BUILDS_DIR/ruby-$VERSION.tar.gz

# Installing
echo "Do you want to install ruby $VERSION to your rbenv? (y/n)"
read INSTALL_RUBY
if [ "$INSTALL_RUBY" == "y" ]; then
    echo "Installing ruby $VERSION..."
    mkdir -p ~/.rbenv/versions/$VERSION
    tar -xzf $BUILDS_DIR/ruby-$VERSION.tar.gz -C ~/.rbenv/versions
else
    echo "Skipping ruby $VERSION installation."
fi
echo "Build process completed. The tarball is located at $BUILDS_DIR/ruby-$VERSION.tar.gz"
