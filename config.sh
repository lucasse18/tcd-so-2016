#!/bin/bash


N_PROC=$(nproc)
MAX_LOAD=${N_PROC}
MAX_JOBS=$((${N_PROC} + 1))

log() {
  echo "[$(basename "$0")] $@"
}

die() {
  log "[ERROR] $@"; exit 1
}

run_make() {
  log "Running make -j${MAX_JOBS} -l${MAX_LOAD} $@..."
  make -j${MAX_JOBS} -l${MAX_LOAD} $@ > /dev/null
}

# diretorio com o source code do kernel descompactado
KERNEL_DIR="../linux-4.4.30"

# arquivos que foram modificados
FILES="arch/x86/entry/syscalls/syscall_64.tbl \
include/uapi/asm-generic/unistd.h \
include/linux/syscalls.h \
kernel/sys_ni.c \
kernel/sys.c
"
