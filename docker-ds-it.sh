#!/usr/bin/env bash

dir="${1:-$PWD}"

docker run -it -v "${dir}":/home/jovyan/work/ jupyter-datascience bash
