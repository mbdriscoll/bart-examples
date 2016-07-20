#!/bin/bash -ex

#
# Reconstructs a 256^3 radial acquisition with 20 coils and wavelet regularization.
#

bart traj -r -3 -x 256 -y 256 traj
bart phantom -3 -k -s 8 -t traj ksp
bart ecalib ksp maps

bart pics -R W:7:0:0.008 -t traj ksp maps img

head -n 2 *.hdr
