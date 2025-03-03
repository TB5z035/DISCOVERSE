#!/bin/bash
set -ex
env | sort
if [ -n "${MODEL_PATH}" ]; then
    MOUNT_ARGS="-v ${MODEL_PATH}:/workspace/models"
fi

docker run -it --rm \
    --network host \
    -e DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    --privileged -v /usr/lib/x86_64-linux-gnu/:/usr/lib/x86_64-linux-gnu/ \
    ${MOUNT_ARGS} \
    ${IMAGE_REF:-"sim-runtime"} \
    python3 ros/play.py $@