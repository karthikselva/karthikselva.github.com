---
comments: true
date: 2010-02-13 22:59:35
layout: post
slug: running-sms-dictionary-server-in-your-home
title: 'Running SMS Dictionary server  in your  Home '
wordpress_id: 440
categories:
- Linux
- Projects
---

_Do you want to run a dictionary server that messages you the actual meaning_

_**Requirments :**_

i)  A GSM mobile phone

ii)  Linux  with python

iii) Mysql Database

iv)  Gnokii-SMSD

You must be sure that** gnokii-smsd** is up and running and database is available

[if not refer to my previous post here](http://karthikselvakumar.wordpress.com/2009/10/30/abc-to-qwerty-messaging/)

_**Code :**_

This code simply connects to dictionary.org and gets the meaning for the word that is latest in INBOX table and writes the meaning to OUTBOX table which will be sent to user later .May have bugs in it please report me at earliest :)

copy and paste the code to a file . let it be **dict_server.py** . code is below :

_#!/usr/bin/python_

_#    before running this program you must configured gnokii-smsd and it must be up and running
#     @Author:    Karthik selvakumar
#    Name :     Dictionary Server_

_# install python-MySQLdb  before importing this module_

_import MySQLdb_

_# imported inorder to perform shell operations_

_import os_

_# run as a daemon and never exit this thread_

_while(True):_

_#defines the database parameter change according to your configuration_

_host="localhost"_

_user="root"_

_passwd="password"_

_db="smsgw"_

_#creates a database object for corresponding config_

_db=MySQLdb.connect(host,user,passwd,db)_

_cursor=db.cursor()_

_#performs pruning of inbox table which may contain null entities_

_cursor.execute("delete from inbox where text=\"\"")_

_#gets the latest entered SMS from Mysql server_

_cursor.execute(" select number,text,id from inbox where id=(select max(id) from inbox)");_

_record=cursor.fetchall()_

_for result in record:_

_# gets the word to find meaning_

_word=result[1]_

_# get the number bcoz u have to reply the meaning to this number later ;)_

_number=result[0]_

_row=result[2]_

_# script to get meaning of a word from google server_

_up='/usr/bin/curl -s -A \'Mozilla/4.0\' \'http://www.google.com/search?q=define%3A\''_

_low='| html2text -ascii -nobs -style compact -width 500 | grep "*" | head -n 1 -q | tail -n 1 > meaning.txt'_

_# run the command in shell and write it to file named meaning.txt_

_os.system(up+word+low)_

_# open the file in read only mode_

_filehandle=open('meaning.txt','r')_

_# load the meaning in the string text_

_text=filehandle.read()_

_# we no more need this_

_filehandle.close()_

_# insert into outbox table which will send the meaning of the word to the phone number later_

_cursor.execute("insert into outbox(number,text) values(%s,%s)",(number,text))_

_# close all active connections :)_

_cursor.close()_

_db.close()_

_#thank you !_

now run the dictionary daemon by running **python dict_server.py** in terminal

whenever a message is received to your mobile it will be read by dict_server.py and meaning of that word will be in outbox table

to see run **select * from outbox ;** in mysql console

Enjoy :)
