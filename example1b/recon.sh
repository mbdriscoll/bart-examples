#!/bin/bash -x

if [ ! -f ksp.cfl ]; then
	bart traj -r -3 -x 256 -y 256 traj1
	bart phantom -3 -k -s 1 -t traj1 ksp2
	bart phantom -3 -S 1 -x 256 maps3
	bart normalize 8 maps3 maps2

	bart repmat 4 2 maps2 maps1 # to emulate multiple sets of maps
	bart repmat 3 20 maps1 maps # to emulate 20 coils
	bart repmat 3 20 ksp2 ksp1 # to emulate 20 coils
	bart repmat 5 300 ksp1 ksp # to emulate 300 time points
	bart repmat 5 300 traj1 traj # to emulate 300 time points
fi

time bart pics -s 0.01 -R L:7:7:0.001 -t traj ksp maps img
