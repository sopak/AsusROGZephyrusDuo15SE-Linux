# setup independent cursor input for touchscreen
xinput create-master TouchScreenGX551QS
TPID=$(xinput --list --id-only "TouchScreenGX551QS pointer")
TTID=$(xinput --list |grep ELAN|grep -v keyboard)
TTID=${TTID#*id=}
TTID=${TTID%*[*}
xinput enable ${TPID}
xinput reattach ${TTID} ${TPID}
xinput map-to-output ${TTID} DisplayPort-0