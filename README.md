# ACE-TAO-RTEMS-installer

This is an installer/builder for ACE-TAO for RTEMS 5.

You will need to build RTEMS under MINGW first.

You will also need to build ACE-TAO under MINGW too. This is because when cross-compiling, the build process executes "tao_idl" and it must run natively.

You can buid ACE-TAO under MINGW by using the following git project: 

https://github.com/matthew-renodin/ACE-TAO-mingw-installer


Once you have accomplished this then you will need to perform the following steps to cross-compile ACE-TAO.

1. Clone this project

git clone https://github.com/matthew-renodin/ACE-TAO-RTEMS-installer ACE-TAO-RTEMS-installer

cd ACE-TAO-RTEMS-installer

2. Edit the following files fixing the paths
    1. setenv 
    2. platform_macros.GNU
    
3. In the ACE-TAO-mingw-installer project the tao_idl.exe needs to be moved to mtao_idl. Then copy the tao_idl_helper as tao_idl to the ACE-TAO-mingw-installer project. There is an issue with exe requiring DLLs that probably need to be installed. the tao_idl_helper has
    
4. 



    
    
  
  



