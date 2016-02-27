---
comments: true
date: 2009-11-16 00:03:34
layout: post
slug: using-windows-nt-boot-loader
title: Using windows NT Boot Loader with Linux
wordpress_id: 329
categories:
- Linux
tags:
- boot loader
- grub reclaim
- multiple OS
- windows linux
---

_
Is your Box factory manufactured with windows and cant use Linux Grub or LILO ?_

_Do you wanna taste the difference booting your Linux system through a windows boot loader ?_

_
_

_**Follow Five simple steps To make it working  :**_

_**
**_

**Step i)  Copy your grub.bin  file to windows **

Open your terminal and run  ** dd if=/dev/sdaN of=grub.bin bs=512 count=1** where **N** denotes your Linux installed medium





**Step ii) Copy the grub.bin file to c:\**

Well now boot into windows and copy **grub.bin** file to your windows  primary medium (you can  use flash medium to take grub.bin from linux )





**step iii) working out in boot.ini **

now set all previleges to boot.ini file by running** attrib -r -w -s c:\boot.ini **on windows





**step iV) add the linux entry to it**

Open the** boot.ini **file and add a line** c:\grub.bin="XPUD " **denoting XP with Ubuntu Desktop , Name is  of your choice





**Step v) save and restart**

Now save all the changes and **restart **now you will see the windows NT loader showing two entires windows and Linux





![http://www.xpud.org/image/windows-boot.png](http://www.xpud.org/image/windows-boot.png)





Switch between any of choices as you wish ;)





_note i: If you got any fatal errors during the switch over try replacing grub by a rescue disk_

_
note ii: if you choose not to place MBR with GRUB during linux installation then  you have no choice to load your Linux from hard disk ( for advanced users ) then you can use live CD and run above commands for Linux to fix it up _

_
_

If you are ready to loose the power of grub and want  something experimenting and new I recommend  this ;)
