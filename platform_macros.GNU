inline=0
HOST_ROOT := /home/mrenodin/projects/ACE_TAO-MINGW/ACE_TAO/ACE/bin/tao_idl.exe
include $(ACE_ROOT)/include/makeinclude/platform_rtems.x_g++.GNU
TAO_IDL := $(HOST_ROOT)/bin/tao_idl 
TAO_IDLFLAGS += $(HOST_ROOT)/bin/ace_gperf 
TAO_IDL_DEP := $(HOST_ROOT)/bin/tao_idl$(EXEEXT) 

