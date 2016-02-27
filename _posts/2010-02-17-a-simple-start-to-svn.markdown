---
comments: true
date: 2010-02-17 23:40:10
layout: post
slug: a-simple-start-to-svn
title: A simple start to SVN
wordpress_id: 444
categories:
- Linux
---

SVN is a version control system used to track your various versions of your software over various levels called **Revisions**.

Basically every software will be stored in SVN as REPO called **Repositories .**

_**Step1 :**_

First before starting with your coding create a repo name in SVN as :

**svnadmin create<your-repo-name>**

e.g) svnadmin create mediaplayer

now you have created a repo named **mediaplayer**

this copy is the master copy for all clients

this will be a directory with some system defined files in it

note the directory you have  created a repositiory

_**Step 2:**_

now you cannot directly do modify on master copy

you have to checkout this repo to some workspace and start working

let it be a directory called workspace

**mkdir workspace**

**cd workspace**

now you can checkout the master copy and start your coding process

**svn co file:///home/<user-name>/<repo-name>**

eg:)  svn co file:///home/karthik/mediaplayer

now you will have a directory named mediaplayer

go into the directory  by

**cd mediaplayer**

then start a code name it as **myfile.java**

now save it in this directory  . To add this into your master copy do

**svn add  <file-name>**

eg) svn add myfile.java

_**Step 3:**_

you can optionally use these commands

**i) svn commit** - to  commit the current modification to the master copy ( Do this whenever you do minor changes to you files)

**ii) svn status** - to check the status of files in working copy

**here ****? **means unknown ** A **means added** M** means modified but not added

**iii) svn update** - to update to the latest revision of the master copy ( this will be usefull when more than one client has modified the master copy without your knowledge )

[for more details refere here ](http://www.linuxfromscratch.org/blfs/edguide/chapter03.html)

Thank you :)
