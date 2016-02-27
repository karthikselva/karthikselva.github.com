---
comments: true
date: 2010-01-01 15:35:04
layout: post
slug: facebook-mouseclicks-hack
title: Facebook mouseclicks hack !
wordpress_id: 405
categories:
- Current affairs
- Linux
tags:
- facebook
- hack
- java
- robot class
---

I came across a facebook application which counts maximum number of clicks per second and thought of emulating it in java ;)

it is as simple as a crap code ... with simple steps [Download it from here](http://www.box.net/shared/6gfq0vh81p)

_**step 1:**_

I wrote a java code which automtes mouseclicks for N times by for loop

the code seems like :

_import java.awt.Robot;
import java.awt.event.InputEvent;
/**
*
* @author karthik
*/
public class Main {
/**
* @param args the command line arguments
*/
public static void main(String[] args) throws Throwable {
Robot r=new Robot();_

_ System.out.println("Hurry up ! you have 10 seconds left ");
System.out.println("This time you must have focused your mouse pointer on START button of facebook appln");
r.delay(10000);_

_// TODO code application logic here
for(int i=0;i<10000;i++){
r.mousePress(InputEvent.BUTTON1_MASK);
System.out.println("Clicking "+i+"th time ");
r.mouseRelease(InputEvent.BUTTON1_MASK);
System.out.println();
System.out.println();
}System.out.println("Congrats ! you did it man  B-)");_

_}
}_

now save the code as **Main.java** in a directory **c:\** in windows or **/home **in linux

_**step 2:**_

open **terminal **

compile the java code by running from the location where code is located by

**javac Main.java**

in the mean time open the [facebook application ](http://apps.facebook.com/mychallengeclick/?ref=m)

![](http://lh6.ggpht.com/_QvG2jVxfMUw/Sz3J9TO3zRI/AAAAAAAAAhQ/nzo2DulsNks/s1024/snapshot1.png)

_**step 3:**_

Run the java code now this is critical part

**java Main **

**( you can directly run this  by extracting Main.java.zip from above )
**

you will get a screen saying

_"Hurry up ! you have 10 seconds left_

_This time you must have focused your mouse pointer on START button of facebook appln"_

now focus your mouse pointer to the **START** button of fb appln

you will get a count more than 200 sometimes even 300 clicks per second ( depending on ur jvm )

**for more clear details watch the video below :**

[youtube=http://www.youtube.com/watch?v=qKdb4E28q6Y]

Thank you :)

_**Disclaimer :**_

If you move your mouse button other than start button you will get random results around screen and may hang at times so keep the mouse pointer in **START **button for atleast a minute ;)
