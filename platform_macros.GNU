inline=0
HOST_ROOT := $(HOST_ACE_ROOT)
TAO_IDL = $(HOST_ROOT)/bin/tao_idl_helper
TAO_IDLFLAGS += $(HOST_ROOT)/bin/ace_gperf.exe
TAO_IDL_DEP = $(HOST_ROOT)/bin/tao_idl$(EXEEXT) 
include $(ACE_ROOT)/include/makeinclude/platform_rtems.x_g++.GNU

