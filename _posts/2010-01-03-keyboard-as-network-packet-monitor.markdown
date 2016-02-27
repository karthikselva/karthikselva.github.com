---
comments: true
date: 2010-01-03 19:18:02
layout: post
slug: keyboard-as-network-packet-monitor
title: Keyboard as Network  Packet Monitor
wordpress_id: 415
categories:
- Linux
- Projects
---

_ You can transform Your NUM lock and SCROLL lock led's to monitor packets send and receive :)_

_Follow the simple steps below :_

_**i) Installation:**_

Install tleds package  bye **sudo apt-get install tleds**

**_ii) Configure :_**

now configure the interface you use

say for ethernet  run **tleds eth0 **

and for wirless  run **tleds wlan0**

_Perform a restart :)_

_**iii) Customize :**_

Now you can adjust the **delay** to very quick response to low response rate by adjusting -d paramter in tleds

for very quick run **tleds  eth0 -d 1**

for low speed run **tleds eth0 -d 200**

_now you have  tranformed your keyboard to packet monitoring system as below :_

_[![](http://karthikselvakumar.files.wordpress.com/2010/01/image05141-e1262527604460.jpg?w=300)](http://karthikselvakumar.files.wordpress.com/2010/01/image05141.jpg)
_

enjoy :)
