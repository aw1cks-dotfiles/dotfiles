#!/bin/sh

USER='migueravila'
REPO='SimpleFox'
URL="https://github.com/${USER}/${REPO}/zipball/master"

TMP_DIR="$(mktemp -d)"
cd "${TMP_DIR}"

curl -sL "${URL}" > 'simplefox.zip'
unzip 'simplefox.zip'

SRC_DIR="$(find . -name 'chrome')"
PROFILE_DIR="$(find "${HOME}/.mozilla/firefox" -name '*default-release' | head -1)"
rm -rf "${PROFILE_DIR}/chrome"
mv "${SRC_DIR}" "${PROFILE_DIR}"

PATCH="${XDG_CONFIG_HOME:-$HOME/.config}/simplefox.patch"
if [ -f "${PATCH}" ]; then
  cd "${PROFILE_DIR}/chrome"
  patch -p1 < "${PATCH}" || true
fi

cd
rm -rf "${TMP_DIR}"
