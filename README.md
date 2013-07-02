# SkidOS

A basic Operating System designed with the Raspberry Pi in mind for educational purposes.

## Deps

I have been using a pre-built GNU ARM toolchain with great success. It can be found here: https://launchpad.net/gcc-arm-embedded

## Running

To build SkidOS, run `make` and copy the contents of the boot/ directory into the root of a FAT32-formatted SD card. (If you already had an OS flashed [such as Rasbian] you can either overwrite the existing files *or* replace only the kernel.img file. The boot/ folder contains all the files needed to boot the OS. Feel free to back-up the existing OS to restore later.)

## Emulation

Mounting, writing, unmounting, and plugging the SD card into the Pi repeatedly can get tediously boring. For that reason, Emulation is a top priority for SkidOS. Currently, however, the actual OS only blinks the 'OK' light repeatedly. Emulation instructions will be added at some point (hopefully in the near future) for testing or experimentation purposes.

### Misc.

Thanks for checking out SkidOS! If you have any questions, feel free to hit me up at @SirSkidmore on either [Twitter](https://twitter.com/SirSkidmore) or App.net (https://alpha.app.net/sirskidmore) or checkout my [website](http://skidmo.re).