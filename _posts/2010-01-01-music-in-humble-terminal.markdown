---
comments: true
date: 2010-01-01 12:51:29
layout: post
slug: music-in-humble-terminal
title: Music in Humble terminal
wordpress_id: 401
categories:
- Linux
tags:
- music
- record terminal
- sox
- terminal player
---

_ i)  Are you in need of humble player which consumes least your memory_

_ii)  If your xserver doesnt open and your prompted to a black terminal   and need of a playing music.. _

_iii) if your admin blocked gui
_

Dont worry still you can hear your favourite  Music files by following simple steps

**_Step 1:_**

install the **sox** for linux by running

**sudo apt-get install sox**

_**Step 2:**_

install mp3 codec for sox (since most of our songs are in .mp3 )

**sudo apt-get install libsox-fmt-mp3**

_**Step 3 :**_

Now your done with  :)

just locate the music folder and run the file

**karthik@karthik: play  my-favourite-song.mp3**

for eg:

_karthik@Karthik:~/Music$ play I\'m\ So\ Available.mp3_

_I'm So Available.mp3:_

_File Size: 7.93M     Bit Rate: 239k
Encoding: MPEG audio    Info: 2009
Channels: 2 @ 16-bit   Track: 3
Samplerate: 44100Hz      Album: Akon - Collection
Replaygain: off         Artist: Akon Feat. Flo-Rida
Duration: 00:04:25.51  Title: I'm So Available_

_In:0.84% 00:00:02.23 [00:04:23.28] Out:107k  [  ====|====- ]        Clip:0_

this is what you will see

_**Step 4: **_

not only listening you can also record from terminal

**karthik@karthik: rec my-recording.wav**

you will se output recording screen as

_Input File     : 'default' (alsa)
Channels       : 2
Sample Rate    : 48000
Precision      : 16-bit
Sample Encoding: 16-bit Signed Integer PCM_

_In:0.00% 00:00:01.96 [00:00:00.00] Out:90.1k [      |      ]        Clip:0_

now your recording will be saved in my-recording.wav file in music folder

enjoy with sox :)
