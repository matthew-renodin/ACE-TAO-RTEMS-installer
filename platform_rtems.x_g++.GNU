# -*- Makefile -*-

# RTEMS 4.6.6 and later with GNU g++.

CROSS-COMPILE = 1

debug ?= 1
optimize ?= 1
threads ?= 1

shared_libs =
static_libs = 1
rwho = 0

ifneq (,$(HOST_ROOT))
  TAO_IDL = $(HOST_ROOT)/bin/tao_idl_helper
  TAO_IDL3_TO_IDL2 = $(HOST_ROOT)/bin/tao_idl3_to_idl2
  TAO_IDL_DEP = $(TAO_IDL)
  TAO_IDL3_TO_IDL2_DEP = $(TAO_IDL3_TO_IDL2)
endif

ifeq (,$(RTEMS_MAKEFILE_PATH))
  default:
	@ERROR: you must set your RTEMS_MAKEFILE_PATH environment variable
endif # RTEMS_MAKEFILE_PATH

ifeq (,$(PERL_PATH))
  PERL_PATH = perl
endif # ! PERL_PATH

include $(RTEMS_MAKEFILE_PATH)/make/Makefile.inc
include $(RTEMS_MAKEFILE_PATH)/make/target.cfg

# Test for template instantiation.

#ifeq (no,$(RTEMS_HAS_NETWORKING))
# CFLAGS += -DACE_LACKS_NETWORKING
# CCFLAGS += -DACE_LACKS_NETWORKING
#endif


CPPFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP) -B$(RTEMS_KERNEL)/bsps/$(ARCH)/$(BSP)/start -B$(RTEMS_KERNEL)/bsps/$(ARCH)/shared/start/ -specs bsp_specs -qrtems -fpermissive -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -fPIC -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS 
DCFLAGS         += -g
DCCFLAGS        += -g
DLD             = $(LD)
PIC		= -fPIC

CFLAGS += -I$(WAF_PATH)/rtemsbsd/arm/include 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/arm/include 
CFLAGS += -I$(WAF_PATH)/rtemsbsd/include 
CFLAGS += -I$(WAF_PATH)/freebsd/sys 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/ck/include 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/libsodium/src/libsodium/include 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/libsodium/src/libsodium/include/sodium 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/pf 
CFLAGS += -I$(WAF_PATH)/freebsd/crypto 
CFLAGS += -I$(WAF_PATH)/freebsd/crypto/openssl/include 
CFLAGS += -I$(WAF_PATH)/freebsd/sys/net 
CFLAGS += -I$(WAF_PATH)/freebsd/include 
CFLAGS += -I$(WAF_PATH)/freebsd/lib 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libbsdstat 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libcapsicum 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libcasper 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/include 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/isc/include 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/resolv 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libutil 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libkvm 
CFLAGS += -I$(WAF_PATH)/freebsd/lib/libmemstat
CFLAGS += -I$(WAF_PATH)/freebsd/contrib/expat/lib 
CFLAGS += -I$(WAF_PATH)/freebsd/contrib/libpcap 
CFLAGS += -I$(WAF_PATH)/freebsd/contrib/libxo 
CFLAGS += -I$(WAF_PATH)/ipsec-tools/src/libipsec 
CFLAGS += -I$(WAF_PATH)/linux/include 
CFLAGS += -I$(WAF_PATH)/linux/include 
CFLAGS += -I$(WAF_PATH)/linux/drivers/net/ethernet/freescale/fman 
CFLAGS += -I$(WAF_PATH)/rtemsbsd/sys 
CFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSCore 
CFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSShared 
CFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSPosix 
CFLAGS += -I$(ACE_ROOT)/waf
CFLAGS += -I$(WAF_PATH)/build-include 
CFLAGS += -DHAVE_DLFCN_H=1 -DHAVE_RTEMS_PCI_H=1 -DHAVE_RTEMS_RTEMS_DEBUGGER_H=1
CFLAGS	+= -I"$(RTEMS_TOOLS)/arm-rtems5/include/" -I"$(RTEMS_PATH)/include/" -I"$(RTEMS_KERNEL)/cpukit/include/" -I"$(RTEMS_KERNEL)/cpukit/libfs/src/jffs2/include/" -I"$(RTEMS_KERNEL)/cpukit/libnetworking" -I"$(RTEMS_KERNEL)/bsps/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_KERNEL)/cpukit/score/cpu/$(ARCH)/include/" -I"$(RTEMS_MAKEFILE_PATH)/include/" -I"$(RTEMS_KERNEL)/bsps/include/" -I"$(RTEMS_KERNEL)/bsps/$(ARCH)/include/" -I"$(RTEMS_KERNEL)/cpukit/include/rtems/"


CPPFLAGS += -I$(WAF_PATH)/rtemsbsd/arm/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/arm/include 
CPPFLAGS += -I$(WAF_PATH)/rtemsbsd/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/ck/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/libsodium/src/libsodium/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/libsodium/src/libsodium/include/sodium 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/contrib/pf 
CPPFLAGS += -I$(WAF_PATH)/freebsd/crypto 
CPPFLAGS += -I$(WAF_PATH)/freebsd/crypto/openssl/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/sys/net 
CPPFLAGS += -I$(WAF_PATH)/freebsd/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libbsdstat 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libcapsicum 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libcasper 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/isc/include 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libc/resolv 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libutil 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libkvm 
CPPFLAGS += -I$(WAF_PATH)/freebsd/lib/libmemstat
CPPFLAGS += -I$(WAF_PATH)/freebsd/contrib/expat/lib 
CPPFLAGS += -I$(WAF_PATH)/freebsd/contrib/libpcap 
CPPFLAGS += -I$(WAF_PATH)/freebsd/contrib/libxo 
CPPFLAGS += -I$(WAF_PATH)/ipsec-tools/src/libipsec 
CPPFLAGS += -I$(WAF_PATH)/linux/include 
CPPFLAGS += -I$(WAF_PATH)/linux/include 
CPPFLAGS += -I$(WAF_PATH)/linux/drivers/net/ethernet/freescale/fman 
CPPFLAGS += -I$(WAF_PATH)/rtemsbsd/sys 
CPPFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSCore 
CPPFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSShared 
CPPFLAGS += -I$(WAF_PATH)/mDNSResponder/mDNSPosix 
CPPFLAGS += -I$(ACE_ROOT)/waf 
CPPFLAGS += -I$(WAF_PATH)/build/arm-rtems5-xilinx_zynq_zc706-everything/build-include/
CPPFLAGS += -DHAVE_DLFCN_H=1 -DHAVE_RTEMS_PCI_H=1 -DHAVE_RTEMS_RTEMS_DEBUGGER_H=1


CPPFLAGS	+= -I"$(RTEMS_TOOLS)/arm-rtems5/include" -I"$(RTEMS_PATH)/include/" -I"$(RTEMS_KERNEL)/cpukit/include/" -I"$(RTEMS_KERNEL)/cpukit/libfs/src/jffs2/include/" -I"$(RTEMS_KERNEL)/cpukit/libnetworking" -I"$(RTEMS_KERNEL)/bsps/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_KERNEL)/cpukit/score/cpu/$(ARCH)/include/" -I"$(RTEMS_MAKEFILE_PATH)/include/" -I"$(RTEMS_KERNEL)/bsps/include/" -I"$(RTEMS_KERNEL)/bsps/$(ARCH)/include/" -I"$(RTEMS_KERNEL)/cpukit/include/rtems/"
LD              = $(CXX)
OCFLAGS         += -O0
LDFLAGS += -L$(RTEMS_PATH)/xilinx_zynq_zc706/lib/ -L$(RTEMS_MAKEFILE_PATH)/cpukit/ -L"$(RTEMS_KERNEL)/cpukit" -L"$(RTEMS_KERNEL)/../bsps/$(ARCH)/shared/start" -L. -L../../../lib  
LIBS += $(RTEMS_PATH)/xilinx_zynq_zc706/lib/libbsd.a -Wl,-Bdynamic -lftpd -ltelnetd -lbsd -lm -lz $(RTEMS_MAKEFILE_PATH)/cpukit/librtemstest.a $(RTEMS_MAKEFILE_PATH)/cpukit/librtemscpu.a $(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/librtemsbsp.a $(RTEMS_MAKEFILE_PATH)/cpukit/librtemsdefaultconfig.a

include $(ACE_ROOT)/include/makeinclude/platform_g++_common.GNU



