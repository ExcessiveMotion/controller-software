### Build Setup

install cross-platform compilers:
`sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf`

install build tools: 
`sudo apt update`
`sudo apt install build-essential ninja-build`

install cmake
`sudo apt install cmake`

install debugger:
`sudo apt install gdb-multiarch`

### ZYNQ SSH Setup

ZYNQ username: `em-os`
password: `0`

create ssh keys:
`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
save them in the `core/.ssh` folder

copy ssh key to zynq:
`ssh-copy-id -i .ssh/zynq em-os@192.168.1.123` (your zynq's IP address)

remove past configs if zynq has been re-imaged
`ssh-keygen -f "/home/[user]/.ssh/known_hosts" -R "192.168.1.123"` (your zynq's IP address)

create ssh config:
`mkdir -p ~/.ssh && chmod 700 ~/.ssh`

create config:
`touch ~/.ssh/config`

set permissions:
`chmod 600 ~/.ssh/config`

configure ssh settings:
`nano ~/.ssh/config`

add config:
(replace with actual IP and path to the keys)
```
Host zynq
    HostName 192.168.1.123
    User em-os
    IdentityFile /home/[user]/controller-software/controller-software/core/.ssh/zynq 
    Port 22
```

build project to copy files to zynq

TODO: figure out a way to better handle the permissions, currently you must enter the password each time (maybe not that bad?)

### ZYNQ Setup (run through ssh):

allow write access so we can update it later from vs code (note this is unsafe since a malicious bin could be added)
`sudo chmod u+w controller/bin/controller_core`


update zynq node modules
in controller/web, run `npm install`

update zynq time (required for certs to be valid)
`sudo date -s "2025-3-21 18:37:00"` (use the current time)


### Petalinux Setup:
package images:
`petalinux-package --boot --fsbl --u-boot --force`

create disk image:
`petalinux-package --wic --outdir /home/[your_output_dir] --wic-extra-args "-c xz" -b "BOOT.BIN,image.ub,boot.scr" --wks project-spec/configs/rootfs.wks`





