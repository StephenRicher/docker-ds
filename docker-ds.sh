#!/usr/bin/env bash

dir="${1:-$PWD}"

docker run -v "${dir}":/home/jovyan/work/ -p 8888:8888 -p 8050:8050 --detach \
  jupyter-datascience jupyter lab --ip 0.0.0.0 --no-browser
