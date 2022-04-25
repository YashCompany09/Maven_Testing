#!/bin/bash

echo "build ..."
if [ "local_Cable's_sdkg" = $1 ] ; then
  mvn clean install -pl Cable's-sdkg-client,Cable's-sdkg-provider,Cable's-sdkg-generator -am
elif [ "publish_Cable's_sdkg" = $1 ] ; then
  mvn clean deploy -Prelease -pl Cable's-sdkg-client,Cable's-sdkg-provider,Cable's-sdkg-generator -am
elif [ "package_Cable's" = $1 ] ; then
  mvn compile -pl Cable's-codeg/Cable's-api -am -Dapigc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-bundle -am -Dbdgc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-bundle-mock -am -Dbdmgc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-client -am -Dclientgc.skip=false
  mvn package -pl Cable's-codeg/Cable's-api,Cable's-codeg/Cable's-bundle,Cable's-codeg/Cable's-bundle-mock,Cable's-codeg/Cable's-client -am
elif [ "local_Cable's" = $1 ] ; then
  mvn compile -pl Cable's-codeg/Cable's-api -am -Dapigc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-bundle -am -Dbdgc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-client -am -Dclientgc.skip=false
  mvn install -pl Cable's-codeg/Cable's-api,Cable's-codeg/Cable's-bundle,Cable's-codeg/Cable's-client -am
elif [ "deploy_Cable's" = $1 ] ; then
  mvn compile -pl Cable's-codeg/Cable's-api -am -Dapigc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-bundle -am -Dbdgc.skip=false
  mvn compile -pl Cable's-codeg/Cable's-client -am -Dclientgc.skip=false
  mvn deploy  -Prelease -pl Cable's-codeg/Cable's-api,Cable's-codeg/Cable's-bundle,Cable's-codeg/Cable's-client -am
elif [ "package_Cable's_mock_server" = $1 ] ; then
  mvn package -pl Cable's-codeg/Cable's-mock-server -am -Dbdmgc.skip=false
elif [ "clean" = $1 ] ; then
  mvn clean
  rm -rf Cable's-codeg/Cable's-api/src
  rm -rf Cable's-codeg/Cable's-bundle/src
  rm -rf Cable's-codeg/Cable's-bundle-mock/src
  rm -rf Cable's-codeg/Cable's-client/src
elif [ "set_version" = $1 ] ; then
  mvn versions:set -DnewVersion=$2
  cd Cable's-codeg
  mvn versions:set -DnewVersion=$2
  cd ..
fi
echo "build done."
