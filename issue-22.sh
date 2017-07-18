#!/usr/bin/env bash

WD=$(pwd)

pushd pepper
./pepperStart.sh "${WD}"/issue-22.pepper
popd
