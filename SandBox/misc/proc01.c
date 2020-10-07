/*
 * Wed 07 Oct 2020 05:18:34 AM UTC
 * Wed 30 Sep 2020 01:00:25 PM WIB
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <gnu/libc-version.h>

int main(void) {
    printf("Hello, the libc version is: %s\n", gnu_get_libc_version());
    long ii=672274793;
    printf("%9.9ld -- %#8.8lX (Linus Torvalds)\n", ii, ii);
    ii=85072278;
    printf("%9.9ld -- %#8.8lX (PM Torvalds) \n", ii, ii);
    ii=369367448;
    printf("%9.9ld -- %#8.8lX (DY Torvalds)\n", ii, ii);
    ii=537993216;
    printf("%9.9ld -- %#8.8lX (CA Torvalds)\n", ii, ii);
    printf("PID %d PPID %d\n", getpid(), getppid());
}


