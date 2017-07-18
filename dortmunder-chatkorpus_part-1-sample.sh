#!/usr/bin/env bash

WD=$(pwd)

pushd pepper
./pepperStart.sh "${WD}"/dortmunder-chatkorpus_part-1-sample.pepper
popd
