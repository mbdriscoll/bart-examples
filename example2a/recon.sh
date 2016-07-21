#!/bin/bash -x

if [ ! -f ksp.cfl ]; then
	bart phantom -3 -k -s 1 -x 256 ksp
	bart phantom -3    -S 1 -x 256 maps

	bart repmat 4 2 maps maps # 2 sets of maps
	bart repmat 3 6 maps maps # 6 coils
	bart repmat 3 6  ksp  ksp # 6 coils
	bart repmat 5 4  ksp  ksp # 4 time points
fi

time bart pics -R L:7:7:0.001 ksp maps img
