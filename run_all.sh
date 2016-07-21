#!/bin/bash -x

for example_dir in example0 example1a example1b example2a example2b; do
  cd $example_dir
  ./recon.sh
  cd ..
done
