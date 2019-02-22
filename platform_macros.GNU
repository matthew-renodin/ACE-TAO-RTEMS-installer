inline=0
HOST_ROOT := /home/IAI/projects/ACE-TAO-mingw-installer/ACE_TAO/ACE
TAO_IDL = $(HOST_ROOT)/bin/mtao_idl 
TAO_IDLFLAGS += -g $(HOST_ROOT)/bin/ace_gperf.exe
TAO_IDL_DEP = $(HOST_ROOT)/bin/mtao_idl$(EXEEXT) 
include $(ACE_ROOT)/include/makeinclude/platform_rtems.x_g++.GNU

