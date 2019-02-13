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

#CFLAGS          += -specs bsp_specs -qrtems -D_REENTRANT -fasm -fno-builtin -fno-defer-pop -fvolatile -fpermissive -DACE_HAS_RTEMS -B$(RTEMS_MAKEFILE_PATH)/lib
#CFLAGS          += -qrtems -D_REENTRANT -fasm -fno-builtin -fno-defer-pop -DACE_HAS_RTEMS -B$(RTEMS_MAKEFILE_PATH)/lib

CFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/start -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/shared/start/ -specs bsp_specs -qrtems -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -Wl,-Ttext,0x00100000 -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -fasm -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS 
CPPFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/start -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/shared/start/ -specs bsp_specs -qrtems -fpermissive -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -Wl,-Ttext,0x00100000 -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -fPIC -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS 
DCFLAGS         += -g
DCCFLAGS        += -g
DLD             = $(LD)
PIC		= -fPIC
CFLAGS	+= -I"/home/matthew/development/rtems/5/arm-rtems5/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libfs/src/jffs2/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libnetworking" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/score/cpu/arm/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/rtems/"
CPPFLAGS	+= -I"/home/matthew/development/rtems/5/arm-rtems5/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libfs/src/jffs2/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libnetworking" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/score/cpu/arm/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/rtems/"
#PIC        =   -qrtems -D_REENTRANT -fasm -fno-builtin -fno-defer-pop -fpermissive -DACE_HAS_RTEMS -B$(RTEMS_MAKEFILE_PATH)/lib -fPIC -fpermissive -I"/home/matthew/development/rtems/5/arm-rtems5/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libfs/src/jffs2/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/libnetworking" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/score/cpu/arm/include/" -I"/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/include/" -I"/home/matthew/development/rtems/kernel/rtems/bsps/arm/include/" -I"/home/matthew/development/rtems/kernel/rtems/cpukit/include/rtems/" -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections
LD              = $(CXX)
#LDFLAGS         += -L"/home/matthew/development/rtems/kernel/rtems/cpukit" -L"/home/matthew/development/rtems/kernel/bsps/arm/shared/start" -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -B/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/start -B$(RTEMS_MAKEFILE_PATH)/lib  -Wl,-Ttext,0x00100000 -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -g -ffunction-sections -fdata-sections /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/librtemsbsp.a /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/librtemscpu.a

OCFLAGS         += -O0
#PIC             = -fPIC -fpermissive 

LDFLAGS += -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -L/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/ -L"/home/matthew/development/rtems/kernel/rtems/cpukit" -L"/home/matthew/development/rtems/kernel/bsps/arm/shared/start" -L. -L../../../lib  


LIBS += /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/librtemscpu.a /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/librtemsbsp.a /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/librtemsdefaultconfig.a

include $(ACE_ROOT)/include/makeinclude/platform_g++_common.GNU
#arm-rtems5-g++ -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -mtune=cortex-a9 -O0 -g -ffunction-sections -fdata-sections -Wall -B/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/xilinx-zynq/start -B/home/matthew/development/rtems/kernel/rtems/bsps/arm/shared/start/ -specs bsp_specs -qrtems -L/home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/ -L"/home/matthew/development/rtems/kernel/rtems/cpukit" -L"/home/matthew/development/rtems/kernel/bsps/arm/shared/start" -L. -L../../../lib  -Wl,--wrap=printf -Wl,--wrap=puts -Wl,--wrap=putchar -Wl,--gc-sections -Wl,--allow-multiple-definition -Wl,-Ttext,0x00100000 -DACE_HAS_CUSTOM_EXPORT_MACROS=0 -o SAXPrint .obj/Print_Handler.o .obj/SAXPrint_Handler.o .obj/main.o -lACEXML_Parser -lACEXML -lACE /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/lib/libbsp/arm/xilinx-zynq/librtemsbsp.a /home/matthew/development/rtems/kernel/xilinx-zynq-qemu/arm-rtems5/c/xilinx_zynq_a9_qemu/cpukit/librtemscpu.a


