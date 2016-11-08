#!/bin/sh
set -e
. ./config.sh
. ./bootstrap.sh


# gera arquivo com as diferencas entre nossa versao e a original
#echo -n "" > patch/syscall_patch.diff
#for file in $FILES; do
#  log "diffing $file"
#  # com 'set -e' o fato de o programa 'diff' retornar um valor nao zero seria interpretado
#  # como um erro e o script seria terminado. o if a seguir foi utilizado como um workaround
#  # para esse problema
#  if [ $(diff -c "${KERNEL_DIR}/$file" "src/$file" >> patch/syscall_patch.diff) ]; then
#    log ""
#  fi
#done
#
## aplica o patch (diff) gerado
#patch -p0 -i patch/syscall_patch.diff

for file in $FILES; do
  cp "${KERNEL_DIR}/${file}" "src/${file}.orig"
  cp "src/${file}" "${KERNEL_DIR}/${file}"
done

# (re)compila o kernel
cd ${KERNEL_DIR}
run_make
run_make modules
cd -

## reverte o patch para que na proxima execucao o arquivo diff seja criado com
## base na source original
#patch -p0 -Ri patch/syscall_patch.diff

for file in $FILES; do
  mv "src/${file}.orig" "${KERNEL_DIR}/${file}"
done
