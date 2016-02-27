---
comments: true
date: 2010-02-10 16:38:25
layout: post
slug: installing-network-simulator-2-in-ubuntu
title: 'Installing Network Simulator 2 in Ubuntu '
wordpress_id: 435
categories:
- Current affairs
- Linux
---

_Are you baffled by random errands saying "  ns2 doesn't work on ubuntu " and so ?_

_Are you a linux geek don't wanna boot to windows for network simulator software ?_

_did your lab admin made a mess with your system in the name of installing ns2 :D ?_

_then you are in a right place :)
_

**You can make NS working in your system by putting little effort  on your ubuntu :)**

_**Step 1:**_

Download [network simulator software from here ](http://sourceforge.net/projects/nsnam/files/)

if you prefer other old versions you can swich by viewing files in that page

the file will be of almost 57 MB

_**Step 2: **_

Extract the files to your own desired directory

I did in **/home/karthik/Desktop/ **

_**step 3:**_

now go to your working directory of ns2 by

**cd /home/karthik/Desktop/ns-allinone-2.34**

_**step 4:**_

Run this command to check any unresolved dependencies existing between installation

**sudo apt-get install build-essential autoconf automake libxmu-dev**

run the command **./install** in terminal

it will take around 5 minutes

_**step 5:**_

Well Thats were your installation of ns2 exits :)

now you have to configure to make it alive

you have to edit in the shell

run **gedit ~./bashrc**

add at end of the file this lines

remember change  **/home/karthik/Desktop/ **to your file path say **/home/host-name/**

**
**

_# LD_LIBRARY_PATH
OTCL_LIB=/home/karthik/Desktop/ns-allinone-2.34/otcl-1.13
NS2_LIB=/home/karthik/Desktop/ns-allinone-2.34/lib
X11_LIB=/usr/X11R6/lib
USR_LOCAL_LIB=/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OTCL_LIB:$NS2_LIB:$X11_
LIB:$USR_LOCAL_LIB_

_# TCL_LIBRARY
TCL_LIB=/home/karthik/Desktop/ns-allinone-2.34/tcl8.4.18/library
USR_LIB=/usr/lib
export TCL_LIBRARY=$TCL_LIB:$USR_LIB_

_# PATH
XGRAPH=/home/karthik/Desktop/ns-allinone-2.34/bin: /home/karthik/Desktop/
ns-allinone-2.34/tcl8.4.18/unix : /home/karthik/Desktop/ns-allinone-2.34/tk8.4.18/unix
NS=/home/karthik/Desktop/ns-allinone-2.34/ns-2.34/
NAM=/home/karthik/Desktop/ns-allinone-2.34/nam-1.14/
PATH=$PATH:$XGRAPH:$NS:$NAM_

now save the file and close it

run** source ~/.bashrc**

ignore if any errors ;)

then run** ./validate**

this is the longest step it takes **30-45 minutes** hence you can have a meal during the course of time ;)

_**step 6: **_

this  is editing thing ( optional )

just make  links to the files in **/home/karthik/Desktop/ns-allinone-2.34/bin ** by right click on all files and choose **make link**

copy  all and paste to **/usr/bin/ **directory  by running

**sudo nautilus**

then** rename** the file name for eg) **link to ns ** to **ns** and so on . do this till all files are renamed .

_**step 7: **_

Sample code

now u can check out a demo to test you ns 2 by writing a sample code as below :

_#Create a simulator object
set ns [new Simulator]_

_#Open the nam trace file
set nf [open out.nam w]
$ns namtrace-all $nf_

_#Define a 'finish' procedure
proc finish {} {
global ns nf
$ns flush-trace
#Close the trace file
close $nf
#Execute nam on the trace file
exec nam out.nam &
exit 0
}_

_#Create two nodes
set n0 [$ns node]
set n1 [$ns node]_

_#Create a duplex link between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail_

_#Call the finish procedure after 5 seconds of simulation time
$ns at 5.0 "finish"_

_#Run the simulation
$ns run_

now copy this code and paste to a file say  **myfirstprogram.tcl**

then run **ns myfirstprogram.tcl**

you must see a window like this :

[![my ubuntu screen running NS2](http://karthikselvakumar.files.wordpress.com/2010/02/my_ubuntu_ns2.png)](http://karthikselvakumar.files.wordpress.com/2010/02/my_ubuntu_ns2.png)

and  ...   You did it , Enjoy   :)
