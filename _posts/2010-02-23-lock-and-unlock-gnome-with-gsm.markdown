---
comments: true
date: 2010-02-23 00:18:22
layout: post
slug: lock-and-unlock-gnome-with-gsm
title: lock and unlock gnome with gsm
categories:
- Linux
- Projects
---

**_Tested with :_**
==================
1. ubuntu 8.10

2. gnokii

3. mysql 5

4. lg kp 199

_**Functionalities :**_
======================
1. just message "**lock**" to your server mobile to lock the screen

2.   "**unlock**" to release the screen

3. you can even change the pidgin status by messaging "**status:your status here** "

4.  execute any shell commands that take return value  below 160  characters

_**Procedure:**_
================
**_step 1) _**
--------------
+ set the memory for sms to sim and run the smsd daemon as

**sudoo /usr/sbin/smsd -u root -d smsgw -c localhost -m mysql -u root --password=password -b SM -f /var/log/smsdaemon.log**

_**step 2)**_
-------------
+ run this python script  and minimize the shell

``` python
#!/usr/bin/python
#    before running this program you must configured gnokii-smsd and it must be up and running
#     @Author:    Karthik selvakumar
#    Name :     Dictionary Server

# install python-MySQLdb  before importing this module
import MySQLdb
import os
processed=1;
while(True):
  host="localhost"
  user="root"
  passwd="123456"
  db="smsgw"

  db=MySQLdb.connect(host,user,passwd,db)
  cursor=db.cursor()
  cursor.execute("delete from inbox where text=\"\"")
  cursor.execute(" select number,text,id,processed from inbox where id=(select max(id) from inbox)")
  record=cursor.fetchall()
  for result in record:
    word=result[1]
    number=result[0]
    row=result[2]
    processed=result[3]

    if(processed==0):
# script to get meaning of a word from google server
      if(word=="lock"):
        up="gnome-screensaver-command --lock";

      elif(word=="unlock"):
        up="xset dpms force on && gnome-screensaver-command -d";

      elif(word.startswith("status:")):
        up=" purple-remote \"setstatus?status=available&message="+str(word.replace("status:",""))+"\"";

      else:
        up=word+" >meaning.txt";

#set the entity to be processed when taken out
    cursor.execute(" update inbox  set processed=1 where id="+str(row));

# run the command in shell and write it to file named meaning.txt
      os.system(up)
      filehandle=open('meaning.txt','r')

# load the meaning in the string text
      text=filehandle.read()
      print " text is "+text;
      filehandle.close()
      if(text!=""):
        cursor.execute("insert into outbox(number,text) values(%s,%s)",(number,text))
      cursor.close()
      db.close()
```
_**step 3)**_
-------------
+ You are done. Now message to the mobile you have connected like **lock or unlock or status:status** to see the magic happen :)
