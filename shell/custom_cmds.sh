#!/bin/bash

docker_bash() {
    if [[ -z "$1" ]]; then
        echo """
        Please give docker image name.

        [Usage] docker_bash [DOCKER_OPTIONS] IMAGE_NAME
        """
        return
    fi

    user_opt="-u $USER"
    working_opt="-w $PWD"
    for opt in "$@"; do
        if [[ $opt == "-u" ]]; then
            user_opt=""
        fi
        if [[ $opt == "-w" ]]; then
            working_opt=""
        fi
    done

    docker run --rm -it -v /home:/home $user_opt $working_opt $@ bash
}
