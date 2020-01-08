#!/bin/bash

for i in $(ls | grep -v Source3.7 | grep -v copy.sh ); do rm -rf $i; done
cp -r Source3.7/build/html/* .
touch .nojekyll



