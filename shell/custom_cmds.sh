#!/bin/bash

docker_bash() {
    user_opt="-u $USER"
    for opt in "$@"; do
        if [[ $opt == "-u" ]]; then
            user_opt=""
        fi
    done

    docker run --rm -it -v /home:/home $user_opt $@ bash
}
