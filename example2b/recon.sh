#!/bin/bash -x

if [ ! -f ksp.cfl ]; then
	bart phantom -3 -k -s 1 -x 256 ksp
	bart phantom -3    -S 1 -x 256 maps

	bart repmat 4 2  maps maps # 2 sets of maps
	bart repmat 3 20 maps maps # 20 coils
	bart repmat 3 20 ksp  ksp # 20 coils
	bart repmat 5 20 ksp  ksp # 20 time points
fi

time bart pics -R L:7:7:0.001 ksp maps img
