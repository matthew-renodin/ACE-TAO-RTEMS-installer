#!/bin/bash



	#install mpc	
	git clone https://github.com/DOCGroup/MPC.git
	
	
	#source the env
	source setenv
	echo $ACE_ROOT
	
	#install ACE_TAO

	git clone https://github.com/matthew-renodin/ACE_TAO.git
	
	
	#cp platform_mingw32.GNU ACE_TAO/ACE/include/makeinclude/
	cp platform_macros.GNU ACE_TAO/ACE/include/makeinclude/
	cp macros.GNU ACE_TAO/ACE/include/makeinclude
	cp platform_rtems.x_g++.GNU ACE_TAO/ACE/include/makeinclude/
	cp config.h ACE_TAO/ACE/ace
	cp rTAO.mwc ACE_TAO/TAO
	cp mACE.mwc ACE_TAO/ACE
	cp OS_NS_unistd.inl ACE_TAO/ACE/ace
	cp tao_idl_helper $HOST_ACE_ROOT/bin
	cp WAF-Rtems_init.c ACE_TAO/ACE/ace/Rtems_init.c

	source config.inc
	sed -e 's/@NET_CFG_SELF_IP@/'$NET_CFG_SELF_IP'/' -e 's/@NET_CFG_NETMASK@/'$NET_CFG_NETMASK'/' -e 's/@NET_CFG_PEER_IP@/'$NET_CFG_PEER_IP'/' -e 's/@NET_CFG_GATEWAY_IP@/'$NET_CFG_GATEWAY_IP'/'  < waf/network-config.h.in > waf/network-config.h

	cp -R waf ACE_TAO/ACE 


	cd ACE_TAO 

	cd ACE

	#$ACE_ROOT/bin/mwc.pl mACE.mwc -type gnuace
	#make all

	#exiting ACE
	cd ..


	cd TAO

	$ACE_ROOT/bin/mwc.pl rTAO.mwc -type gnuace

	make clean all
	#exiting TAO
	cd ..
	
	#exiting ACE_TAO
	cd ..
	
	
	echo $ACE_ROOT
	echo $TAO_ROOT
	echo $MPC





