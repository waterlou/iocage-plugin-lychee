#!/bin/sh

LYCHEE_PATH=/usr/local/share/lychee

mkdir -p ${LYCHEE_PATH}
cd ${LYCHEE_PATH}

git clone https://github.com/electerious/Lychee.git

chmod -R 750 uploads/ data/

