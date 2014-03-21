#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BASEPATH=$SCRIPTPATH
BUILDPATH=$SCRIPTPATH/build

# Break out a new config file!
if [ ! -f $BASEPATH/config.sh ]; then
  cp $BASEPATH/config-dist.sh $BASEPATH/config.sh
fi

source $BASEPATH/config.sh

rm -rf $BUILDPATH
mkdir $BUILDPATH
cp -R ./etc $BUILDPATH/
cp -R ./www $BUILDPATH/

sed -i "" -e "s@DocumentRoot \".*\"@DocumentRoot \"$BUILDPATH/www\"@g" $BUILDPATH/etc/apache2.conf
sed -i "" -e "s@Directory \".*\"@Directory \"$BUILDPATH/www\"@g" $BUILDPATH/etc/apache2.conf

sed -i "" -e "s@window\.location = \".*\"@window\.location = \"$TODOURL\"@g" $BUILDPATH/www/index.html
