#!/usr/bin/env sh

mkdir -p service/api/lambda/create-bastion/target
mkdir -p service/api/lambda/destroy-bastion/target

cd service/api/lambda/bastion && lein with-profile create uberjar && cp target/create-bastion.jar ../create-bastion/target/
lein with-profile destroy uberjar && cp target/destroy-bastion.jar ../destroy-bastion/target/
cd ../trigger-bastion-destruction && sh bin/build.sh
