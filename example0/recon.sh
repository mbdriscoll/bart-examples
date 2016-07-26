#!/bin/bash -ex

if [ ! -f ksp.cfl ]; then
	bart traj -r -3 -x 256 -y 256 traj
	bart phantom -3 -k -s 1 -t traj ksp
	bart phantom -3 -S 1 -x 256 maps

	bart repmat 4 2 maps maps # to emulate multiple sets of maps
	bart repmat 3 20 maps maps # to emulate 20 coils
	bart repmat 3 20 ksp ksp # to emulate 20 coils
fi

time bart pics -R W:7:0:0.008 -t traj ksp maps img
