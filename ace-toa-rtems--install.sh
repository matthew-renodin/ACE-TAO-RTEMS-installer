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

	cd ACE_TAO 

	cd ACE

	$ACE_ROOT/bin/mwc.pl mACE.mwc -type gnuace
	make all

	#exiting ACE
	cd ..


	cd TAO

	$ACE_ROOT/bin/mwc.pl rTAO.mwc -type gnuace

	make all
	#exiting TAO
	cd ..
	
	#exiting ACE_TAO
	cd ..
	
	
	echo $ACE_ROOT
	echo $TAO_ROOT
	echo $MPC





