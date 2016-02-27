---
comments: true
date: 2009-11-13 18:57:16
layout: post
slug: graphics-h-fails-in-linux
title: 'Graphics.h fails in Linux  ? '
wordpress_id: 247
categories:
- Linux
---

_Are you a Linux critic saying graphics doesn't work on ?


Haven't explored SDL graphic part thrro'   C?


Switched on to linux recently and breaking your heads on graphics libraries for linux ?_





The packages you need before working on with graphics library in linux are:

Try  installing thro' console by 







**sudo apt-get install libsdl-image1.2 libsdl-image1.2-dev guile-1.8 guile-1.8-dev libsdl1.2debian-arts libartsc0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6(upgrade) libaa1 libaa1-dev libslang2-dev libasound2 libasound-dev**







or select the package in **synaptic **it will automatically resolve dependency's








_**LibGraph Installing and configuring:**_

First download libgraph from [ here ](http://www.box.net/shared/bnj7usolue) 

Then as usual extract
tar.gz   and run

**./configure
make
make install
**
write some c with graphics implemenation and name it as **test.c**

Thats it :D








_**Now compile and run the file as:**_

**g++ test.cpp -o test.o -lgraph
And execute the program by ./test.o
**
-lgraph links with graphics library 


if you get any shared library error ( ofcourse most people get this thing)

then shift as  **sudo cp /usr/local/lib/libgraph.* /usr/lib**






you may  now see a SDL output window showing smooth graphical 32 bit output (rather resorted dos window :P ) 








3D chess  game in graphics  C  ![chess](http://mfarrelly.rarelyfar.com/res/chessnix.jpg)








Learn , code and Enjoy Linux geeks  :)








