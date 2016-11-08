#/bin/bash
# script que baixa e descompacta o source code, instala pacotes necessarios para
# a compilacao
set -e
. ./config.sh


if [ ! -d "${KERNEL_DIR}" ]; then
  log "Getting linux source code"
  cd ..
  wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.4.30.tar.xz
  cd -

  log "Getting linux build dependencies"
  sudo apt-get build-dep linux
fi
