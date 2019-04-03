# ACE-TAO-RTEMS-installer

This is an installer/builder for ACE-TAO for RTEMS 5.

You will need to build RTEMS under MINGW first. You must build RTEMS under the MINGW64 or MINGW32 or set the environment variable, this goes for ACE and TAO as well.

You may run into issues trying to compile RTEMS under the MINGW32. 

## Important steps for setting up MINGW

These are required to compile ACE and TAO for RTEMS under MINGW64.

pacman -S python mingw-w64-x86_64-python2 mingw-w64-x86_64-gcc bison cvs diffutils git make patch tar texinfo unzip

pacman -S --needed base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain



## Build RTEMS

cd /opt

git clone git://git.rtems.org/rtems-source-builder.git rsb

cd rsb

./source-builder/sb-check 

cd rtems  

../source-builder/sb-set-builder --prefix=/opt/rtems/tools 5/rtems-arm 




export PATH=/opt/rtems/tools/bin:$PATH



cd /opt/rtems

git clone git://git.rtems.org/rtems.git kernel

cd kernel

./bootstrap -c && ../../rsb/source-builder/sb-bootstrap

cd ../

mkdir xilinx-zynq-qemu

cd xilinx-zynq-qemu

../kernel/configure --prefix=/opt/rtems/bsp --target=arm-rtems5 --enable-rtemsbsp=xilinx_zynq_a9_qemu --enable-posix 

make

make install



## Set PATH

export PATH=/mingw32/bin:$PATH


## Build Host ACE-TAO on MINGW

You will need to build ACE-TAO under MINGW too. This is because when cross-compiling, the build process executes "tao_idl" and it must run natively.

You can buid ACE-TAO under MINGW by using the following git project: 

https://github.com/matthew-renodin/ACE-TAO-mingw-installer


Once you have accomplished this then you will need to perform the following steps to cross-compile ACE-TAO.



## Build (Cross-Compile) ACE-TAO for RTEMS
1. Clone this project

git clone https://github.com/matthew-renodin/ACE-TAO-RTEMS-installer ACE-TAO-RTEMS-installer

cd ACE-TAO-RTEMS-installer

2. Edit the following files fixing the paths
    1. setenv 
    2. platform_macros.GNU
    
3. In the ACE-TAO-mingw-installer project the tao_idl.exe needs to be moved to mtao_idl. Then copy the tao_idl_helper as tao_idl to the ACE-TAO-mingw-installer project. There is an issue with exe requiring DLLs in thecurrent working directory. There is likely a fix for this issue, but it needs to be dealt with in the ACE TAO project. Also, I tried using the platform_macros.GNU but it did not execute the program I specified as expected. I am likley using the wrong variable.
    
4. Once you have accomplished the previous steps and have reviewed the files, execute the ace-tao--rtems-install.sh

./ace-tao--rtems-install.sh



    
    
  
  



