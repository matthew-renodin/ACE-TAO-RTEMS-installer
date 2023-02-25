# ACE-TAO-RTEMS-installer

This is an installer/builder for ACE-TAO for RTEMS 5.

You will need to build RTEMS under MINGW first. You must build RTEMS under the MINGW64 or MINGW32 or set the environment variable, this goes for ACE and TAO as well.

You may run into issues trying to compile RTEMS under the MINGW32. 

Also, you may run into issues if you have Python 3 installed in Windows. You need to ensure that your MINGW is executing the correct Python.

## Important steps for setting up MINGW

These are required to compile ACE and TAO for RTEMS under MINGW64.

You will want to use a MINGW with GCC 7.3.5. It may work on another version, but the GCC 10 version, as of 6/9/2020, exits due to an multiple defintion error when building the RSB. 

### Use this MSYS2 that has MINGW:

This version is no longer available on the site.
http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20180531.exe

pacman -S python mingw-w64-x86_64-python2 mingw-w64-x86_64-gcc bison cvs diffutils git make patch tar texinfo unzip

pacman -S --needed base-devel mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain



## Build RTEMS

python -v should be 2.7.15

### TEST for python:

python -c "import hashlib;m=hashlib.md5();print(m.hexdigest())"


cd /opt

git clone git://git.rtems.org/rtems-source-builder.git rsb

cd rsb

./source-builder/sb-check 

cd rtems  

You could try the following 2 things:

../source-builder/sb-set-builder --prefix=C:/msys64/opt/rtems5/tools 5/rtems-arm

or 

../source-builder/sb-set-builder --prefix=/opt/rtems5/tools 5/rtems-arm 


export PATH=/opt/rtems5/tools/bin:$PATH


mkdir /opt/rtems

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
    
### Notes:
*I made the helper because I misunderstood that MINGW uses the PATH variable for the DLLs
    
4. Once you have accomplished the previous steps and have reviewed the files, execute the ace-tao--rtems-install.sh

./ace-tao--rtems-install.sh



    
    
  
  



