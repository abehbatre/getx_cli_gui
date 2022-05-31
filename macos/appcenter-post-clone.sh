#!/usr/bin/env bash
#Place this script in project/ios/

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b 2.10.4 https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

# flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

# Bump build number
# perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.(`git rev-list --all|wc -l|xargs`)/e' pubspec.yaml

# Bump version by year month + commit count
# month=$(date '+%Y%m')
# count=$(git rev-list --all|wc -l|xargs)
# code=$month$count

# sed -i -pe "s/\(.*version:.*\)/version: $VERSION_NAME+$code/g" pubspec.yaml
flutter config --enable-macos-desktop

flutter build macos --release
