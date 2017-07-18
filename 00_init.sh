#!/usr/bin/env bash
#
# download corpus and tools

PEPPER="Pepper_2017.05.31-SNAPSHOT.zip"

set -e

download() {
    DESTDIR=$(dirname "$1")
	DESTDIR=${DESTDIR:='.'}
    DESTFN=$(basename "$1")
    mkdir -p "${DESTDIR}"

    [ -e "${DESTDIR}/${DESTFN}" ] || (wget --continue -O "${DESTDIR}/.${DESTFN}" "$2" && mv "${DESTDIR}/.${DESTFN}" "${DESTDIR}/${DESTFN}")
}

download "${PEPPER}" "https://korpling.german.hu-berlin.de/saltnpepper/pepper/download/snapshot/${PEPPER}" 
[ -e pepper/${PEPPER}.version ] \
|| 
{ 
    { [ -e pepper/ ] && echo 'rm -rf pepper' && rm -rfI pepper/ ;}
    unzip "${PEPPER}" \
    && touch pepper/"${PEPPER}".version
}
