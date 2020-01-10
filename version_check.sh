#!/bin/bash
# Reference Site

# Check version
CHECK_VER=`cat /etc/nv_tegra_release | sed -n 1P`
R3210="# R32 (release), REVISION: 1.0, GCID: 14531094, BOARD: t210ref, EABI: aarch64, DATE: Wed Mar 13 07:46:13 UTC 2019"
R3231="# R32 (release), REVISION: 3.1, GCID: 18186506, BOARD: t210ref, EABI: aarch64, DATE: Tue Dec 10 06:58:34 UTC 2019"

if [ "${CHECK_VER}" = "${R3210}" ]; then
  echo "R3210 ver"
elif [ "${CHECK_VER}" = "${R3231}" ]; then
  echo "R3231 ver"
else
  echo "another verion"
fi
