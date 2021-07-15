#!/bin/bash
E4S_MIRROR=/global/common/software/spackecp/mirrors/perlmutter-e4s-21.05
for ii in $(spack find --format "yyy {version} /{hash}" |
	    grep -v -E "^(develop^master)" |
	    grep "yyy" |
	    cut -f3 -d" ")
do
  spack buildcache create -af -d $E4S_MIRROR --only=package $ii
done

spack buildcache update-index -d $E4S_MIRROR
