#!/bin/bash

function docker_bash
    if test -z $argv
        echo """
        Please give docker image name.

        [Usage] docker_bash [DOCKER_OPTIONS] IMAGE_NAME
        """
        return
    end
    set user_opt -u $USER
    set working_opt -w $PWD
    for opt in "$argv"
        if test $opt = "-u"
            set user_opt ""
        end
        if test $opt = "-w"
            set working_opt ""
        end
    end

    docker run --rm -it -v /home:/home $user_opt $working_opt $argv bash
end
