---
comments: true
date: 2010-01-31 22:03:06
layout: post
slug: cursor-play-with-your-neigbour-system
title: Cursor Play With your  neigbour System
wordpress_id: 424
categories:
- Linux
- Projects
---

_If you have more than one system and need to acces all with a single mouse ?
_

_Wanna hack your neigbour node and drive him mad?_

_
_

you can use this code to move the cursor

and with little modification you can emulate a whole mouse and keyboard functionalities too ...

**[Download My code from here
](http://www.box.net/shared/dgkikzmvjl)**

**
**

_**To Do :**_

_**
**_

step i) run the server.class first in machine u want to control say A

    
    <strong>java server <port_numbr 1000-65535></strong>


**
**

step ii) run the client.class in second machine u have the mouse say B

    
    <strong>java client <ip of machine say 10.2.3.1 > <port_number_server 1000-65535></strong>


**
**

step iii) move  mouse in machine B so that it moves on machine A

_**Algorithm behind :**_

_** **_i)  get the mouse position from master machine

ii) send the position in a '**encrypt**' string with X and Y positions merged

as **encrypt=X*10000+Y** ( I use 10000  here assuming your screen resolution is not more than 10000X10000 :D )

iii) send the string to slave node using Socket output stream

iv) get the encrypt string and extract x and Y position  by

**X=encrypt/10000;**

**y=encrypt - X;**

**
**

v) Now move the position of slave machine by **mousemove(X,Y)** method

vi) You can add leftclick , right click and **keyboard keys** too as above  :)
