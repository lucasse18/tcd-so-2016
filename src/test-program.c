#include <stdio.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#define __NR_hello 326

static inline long mysys_hello(pid_t pid) {
  return syscall(__NR_hello, pid);
}

int main () {
  printf("Some random text...\n");
  long ret_code;
  if((ret_code = mysys_hello(getpid())) < 0)
    perror("[ERROR]");

  printf("Syscall returned %ld.\n", ret_code);
  return 0;
}
