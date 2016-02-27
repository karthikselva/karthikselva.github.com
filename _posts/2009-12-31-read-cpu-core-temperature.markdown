---
comments: true
date: 2009-12-31 23:00:24
layout: post
slug: read-cpu-core-temperature
title: 'Read CPU Core Temperature '
wordpress_id: 397
categories:
- Linux
tags:
- cpu fan
- cpu temperature
- heat
- java
- Linux
- lmsensor
- sensors
---

Well this is a tricky part where I have struggled for a function returning cpu temp in java and failed . Then I chose lm-sensor for this purpose .

**_step1_**

Installation :

install the package lm sensors for your linux distro

**sudo apt-get install lm-sensors**

**_step 2:_**

run **sensors** in terminal

if you have installed for first time probe it to kernel first

_step 3: _restart the system and try sensors now

I have a core2quad processor and i get temperature of four processors as

_karthik@Karthik:~/Programs$ sensors
coretemp-isa-0000
Adapter: ISA adapter
Core 0:      +47.0°C  (high = +74.0°C, crit = +100.0°C)_

_coretemp-isa-0001
Adapter: ISA adapter
Core 1:      +37.0°C  (high = +74.0°C, crit = +100.0°C)_

_coretemp-isa-0002
Adapter: ISA adapter
Core 2:      +39.0°C  (high = +74.0°C, crit = +100.0°C)_

_coretemp-isa-0003
Adapter: ISA adapter
Core 3:      +46.0°C  (high = +74.0°C, crit = +100.0°C)_

**_step 3: _**

call the **process **class of java and get back the string returned

_import java.io.*;
class cpu {
public static void main(String []args) throws Exception
{
Runtime r=Runtime.getRuntime();
String f,temp,res="";
int i=0,j=0;
f="sensors";
Process p=r.exec(f);
BufferedReader pin=new BufferedReader(new InputStreamReader(p.getInputStream()));
while((temp=pin.readLine())!=null)
{
System.out.println(temp);
}
}_
_}_

Then make it flexible for your own purpose  by proper string parsing ....

Thank you !_**
**_

_
_
