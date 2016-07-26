#!/bin/bash -x

if [ ! -f ksp.cfl ]; then
	bart phantom -3 -k -s 1 -x 256 ksp2
	bart phantom -3    -S 1 -x 256 maps3
	bart normalize 8 maps3 maps2

	bart repmat 4 2  maps2 maps1 # 2 sets of maps
	bart repmat 3 20 maps1 maps # 20 coils
	bart repmat 3 20 ksp2  ksp1 # 20 coils
	bart repmat 5 20 ksp1  ksp # 20 time points
fi

time bart pics -s 0.01 -R L:7:7:0.001 ksp maps img
