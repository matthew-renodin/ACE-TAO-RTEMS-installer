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
  TAO_IDL = $(HOST_ROOT)/bin/tao_idl
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

ifeq (no,$(RTEMS_HAS_NETWORKING))
 CFLAGS += -DACE_LACKS_NETWORKING
 CCFLAGS += -DACE_LACKS_NETWORKING
endif

#CFLAGS          += -specs bsp_specs -qrtems -D_REENTRANT -fasm -fno-builtin -fno-defer-pop -fvolatile -fpermissive -DACE_HAS_RTEMS -B/opt/lib
#CFLAGS          += -qrtems -D_REENTRANT -fasm -fno-builtin -fno-defer-pop -DACE_HAS_RTEMS -B/opt/lib
#CFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP) -B$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/$(BSP)/start -B$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/shared/start/ -specs bsp_specs -qrtems -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -Wl,-Ttext,0x00100000 -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -fasm -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS 

CPPFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP) -B$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/$(BSP)/start -B$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/shared/start/ -specs bsp_specs -qrtems -fpermissive -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -Wl,-Ttext,0x00100000 -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -fPIC -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS 
DCFLAGS         += -g
DCCFLAGS        += -g
DLD             = $(LD)
PIC		= -fPIC
CFLAGS	+= -I"$(RTEMS_PATH)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/libfs/src/jffs2/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/libnetworking" -I"$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/score/cpu/$(ARCH)/include/" -I"$(RTEMS_MAKEFILE_PATH)/include/" -I"$(RTEMS_KERNEL)/../rtems/bsps/include/" -I"$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/include/rtems/"
CPPFLAGS	+= -I"$(RTEMS_PATH)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/libfs/src/jffs2/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/libnetworking" -I"$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/score/cpu/$(ARCH)/include/" -I"$(RTEMS_MAKEFILE_PATH)/include/" -I"$(RTEMS_KERNEL)/../rtems/bsps/include/" -I"$(RTEMS_KERNEL)/../rtems/bsps/$(ARCH)/include/" -I"$(RTEMS_KERNEL)/../rtems/cpukit/include/rtems/"
LD              = $(CXX)
OCFLAGS         += -O0
LDFLAGS += -L$(RTEMS_MAKEFILE_PATH)/cpukit/ -L"$(RTEMS_KERNEL)/../rtems/cpukit" -L"$(RTEMS_KERNEL)/../bsps/$(ARCH)/shared/start" -L. -L../../../lib  
LIBS += $(RTEMS_MAKEFILE_PATH)/cpukit/librtemscpu.a $(RTEMS_MAKEFILE_PATH)/lib/libbsp/$(ARCH)/$(BSP)/librtemsbsp.a $(RTEMS_MAKEFILE_PATH)/cpukit/librtemsdefaultconfig.a

include $(ACE_ROOT)/include/makeinclude/platform_g++_common.GNU


