#!/usr/bin/env bash
#
# download corpus and tools

URL_DTM_CHKO="http://hdl.handle.net/10932/00-0379-FDFE-EB20-0401-1"
NAME_DTM_CHKO="dortmunder-chatkorpus_part-1_v2.1.tgz"

URL_BASE_PEPPER="https://korpling.german.hu-berlin.de/saltnpepper/pepper/download/snapshot/"
NAME_PEPPER="Pepper_2017.05.31-SNAPSHOT.zip"

set -e

download() {
    DESTDIR=$(dirname "$1")
    DESTDIR=${DESTDIR:='.'}
    DESTFN=$(basename "$1")
    mkdir -p "${DESTDIR}"

    [ -e "${DESTDIR}/${DESTFN}" ] || (wget --continue -O "${DESTDIR}/.${DESTFN}" "$2" && mv "${DESTDIR}/.${DESTFN}" "${DESTDIR}/${DESTFN}")
}

download "${NAME_DTM_CHKO}" "${URL_DTM_CHKO}"

download "${NAME_PEPPER}" "${URL_BASE_PEPPER}/${NAME_PEPPER}"
[ -e pepper/${NAME_PEPPER}.version ] \
|| 
{ 
    { [ -e pepper/ ] && echo 'rm -rf pepper' && rm -rfI pepper/ ;}
    unzip "${NAME_PEPPER}" \
    && touch pepper/"${NAME_PEPPER}".version
}
