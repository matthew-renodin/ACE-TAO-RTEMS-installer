//#define ACE_LACKS_SYS_TIME_H 
//#define ACE_LACKS_TIME_H
//#define ACE_HAS_POSIX_TIME
//#define ACE_LACKS_NETWORKING
//#define ACE_HAS_SOCKLEN_T

// There's no host table, by default. So using "localhost" won't work.
// If your system does have the ability to use "localhost" and you want to,
// define it before including this file.

#define ACE_LOCALHOST "127.0.0.1"
#define ACE_LACKS_SBRK
#define ACE_LACKS_TIMESPEC_T
#define ACE_HAS_UALARM
#define ACE_HAS_GETRUSAGE_PROTOTYPE
#define ACE_HAS_CPU_SET_T
#define ACE_LACKS_STD_WSTRING
#define ACE_LACKS_ISCTYPE
#define ACE_LACKS_GAI_STRERROR
#define ACE_LACKS_CLOCKID_T
#define HAVE_STRUCT_TIMESPEC
#define ACE_LACKS_GETADDRINFO
#define ACE_MT_SAFE 1 
#include "ace/config-rtems.h"

