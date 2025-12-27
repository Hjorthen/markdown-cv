#!/bin/bash

sudo docker run --rm --mount type=bind,src=$(pwd),target=/data context "styles/chmduquesne.tex" $1
