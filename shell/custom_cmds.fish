#!/bin/bash

function docker_bash
    set user_opt -u $USER
    for opt in "$argv"
        if test $opt = "-u"
            set user_opt ""
        end
    end

    docker run --rm -it -v /home:/home $user_opt $argv bash
end
