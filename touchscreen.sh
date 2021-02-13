#!/bin/bash

# setup independent cursor input for touchscreen

MASTER_NAME=TouchScreenGX551QS
SLAVE_PREFIX=ELAN
MONITOR_ID=DisplayPort-0

if ! xinput | grep ${MASTER_NAME} >/dev/null ; then
    xinput create-master ${MASTER_NAME}
fi

MASTER_ID=$(xinput --list --id-only "${MASTER_NAME} pointer")

SLAVE_ID=$(xinput --list |grep ${SLAVE_PREFIX}|grep -v keyboard)
SLAVE_ID=${SLAVE_ID#*id=}
SLAVE_ID=${SLAVE_ID%*[*}


echo "MASTER NAME: ${MASTER_NAME}"
echo "MASTER ID: ${SLAVE_ID}"
echo "SLAVE NAME: $(xinput list --name-only |grep ${SLAVE_PREFIX}|head -n 1)"
echo "SLAVE ID: ${MASTER_ID}"

xinput enable ${MASTER_ID}
xinput enable ${SLAVE_ID}
xinput reattach ${SLAVE_ID} ${MASTER_ID}
xinput map-to-output ${SLAVE_ID} ${MONITOR_ID}

echo "Done"