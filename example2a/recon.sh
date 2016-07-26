#!/bin/bash -x

if [ ! -f ksp.cfl ]; then
	bart phantom -3 -k -s 1 -x 256 ksp2
	bart phantom -3    -S 1 -x 256 maps3
	bart normalize 8 maps3 maps2

	bart repmat 4 2 maps2 maps1 # 2 sets of maps
	bart repmat 3 6 maps1 maps # 6 coils
	bart repmat 3 6  ksp2  ksp1 # 6 coils
	bart repmat 5 4  ksp1  ksp # 4 time points
fi

time bart pics -s 0.01 -R L:7:7:0.001 ksp maps img
