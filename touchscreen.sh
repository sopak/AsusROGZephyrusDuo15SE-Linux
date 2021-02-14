#!/bin/bash

# setup independent cursor input for touchscreen

MASTER_NAME=TouchScreenGX551QS
SLAVE_PREFIX=ELAN
MONITOR_MAIN_ID=eDP-1-0
MONITOR_SECOND_ID=DisplayPort-1-0

SLAVE_ID=$(xinput --list |grep ${SLAVE_PREFIX}|grep -v keyboard)
SLAVE_ID=${SLAVE_ID#*id=}
SLAVE_ID=${SLAVE_ID%*[*}
SLAVE_ID=${SLAVE_ID%%+([[:space:]])}
SLAVE_NAME=$(xinput list --name-only |grep ${SLAVE_PREFIX}|head -n 1)

if [ "off" = "${1}" ]; then

    if  xinput | grep ${MASTER_NAME} >/dev/null ; then    
        MASTER_ID=$(xinput --list --id-only "${MASTER_NAME} pointer")
	xinput remove-master ${MASTER_ID}
    fi

    MASTER_ID=$(xinput --list --id-only "Virtual core pointer")

    xinput reattach ${SLAVE_ID} ${MASTER_ID}
    xinput disable ${SLAVE_ID}

    echo "Touchscreen disabled"

elif [ "main" = "${1}" ]; then

    #todo

    if  xinput | grep ${MASTER_NAME} >/dev/null ; then    
        MASTER_ID=$(xinput --list --id-only "${MASTER_NAME} pointer")
	xinput remove-master ${MASTER_ID}
    fi

    MASTER_ID=$(xinput --list --id-only "Virtual core pointer")

    xinput enable ${SLAVE_ID}
    xinput reattach ${SLAVE_ID} ${MASTER_ID}
#    xinput set-mode ${SLAVE_ID} RELATIVE

    echo "Touchscreen assigned to ${MONITOR_MAIN_ID} in RELATIVE mode"


elif [ "touchscreen" = "${1}" ]; then

    if ! xinput | grep ${MASTER_NAME} >/dev/null ; then
	xinput create-master ${MASTER_NAME}
    fi

    MASTER_ID=$(xinput --list --id-only "${MASTER_NAME} pointer")

    echo "MASTER NAME: ${MASTER_NAME}"
    echo "MASTER ID: ${SLAVE_ID}"
    echo "SLAVE NAME: ${SLAVE_NAME}"
    echo "SLAVE ID: ${MASTER_ID}"

    xinput enable ${SLAVE_ID}
    xinput reattach ${SLAVE_ID} ${MASTER_ID}
    xinput map-to-output ${SLAVE_ID} ${MONITOR_SECOND_ID}
#    xinput set-mode ${SLAVE_ID} ABSOLUTE

    echo "Touchscreen assigned to ${MONITOR_SECOND_ID} in ABSOLUTE MODE"
else
    echo "Do nothing"
    exit 1
fi
