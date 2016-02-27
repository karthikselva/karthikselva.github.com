---
comments: true
date: 2009-10-30 15:34:59
layout: post
slug: abc-to-qwerty-messaging
title: 'abc to qwerty Messaging '
wordpress_id: 162
categories:
- Linux
---

Is your hands sore of messaging on whole day with your abc mobile keypad ?


Are you in need of tracking all your messages your loved ones send with some database ?


Need of a online chatting environment for sms ?

Here you are , 


All you need is :

_ i) Any Linux OS
 ii)  Mysql database to store the message
iii) SMSD  to track and send message
iv) gnokii  Suite
_



_**Installing Linux :**_



I guess every one knows how to install linux in your desktop , if not [ Check this link ](https://help.ubuntu.com/community/Installation)
**




_Installing Mysql database :**_


try ** sudo apt-get install mysql**

or 



**directly from synaptic **




_**Installing gnokii and smsd :
**_



**sudo apt-get install gnokii
**
and then



smsd as  **  sudo apt-get install gnokii-smsd-mysql
**





_Now you have setup a base  :D _




_
Step 1:_

**Configuring gnokii:**



 Connect your mobile via datacable or bluetooth to pc

create a file called_ /home/.gnokiirc_

**sudo gedit /home/.gnokiirc**

add this lines to the file if you have Nokia mobile



**
[global]
port = /dev/ttyACM0
model = series40
initlength = default
connection = dku2libusb
use_locking = no
serial_baudrate = 19200
smsc_timeout = 10

[gnokiid]
bindir = /usr/local/sbin/

[connect_script]
TELEPHONE = +919xxxxxxxxx    
[disconnect_script]

[logging]
debug = on
rlpdebug = off
xdebug = off **




replace phone number field with yours 

if you are not Nokia user try [ this link to configure your mobile ](http://wiki.gnokii.org/index.php/Config)

save the file 





Open terminal and type   **sudo gnokii ---identify **




it must say something like this 

_GNOKII Version 0.6.26
LOG: debug mask is 0x1
Config read from file /home/karthik/.gnokiirc.
phone instance config:
model = series40
port = /dev/ttyACM0
connection = dku2libusb
initlength = default
serial_baudrate = 19200
serial_write_usleep = -1
handshake = software
require_dcd = 0
smsc_timeout = 10
rfcomm_channel = 1
sm_retry = 0
Connecting
Serial device: opening device USB
Ignoring extra header, type 171, length 5
Found FBUS interface
Can't set configuration: -16
Getting model...
Message sent: 0x1b / 0x0006
00 01 00 07 01 00                               |                 
Message received: 0x1b / 0x003e
01 39 00 08 00 01 58 38 00 31 56 20 30 35 2e 38 |  9    X8 1V 05.8
30 0a 31 38 2d 31 32 2d 30 38 0a 52 4d 2d 34 39 | 0 18-12-08 RM-49
35 0a 28 63 29 20 4e 6f 6b 69 61 20 20 20 20 20 | 5 (c) Nokia     
20 20 20 20 20 20 20 0a 4d 48 00 00 00 00       |         MH      
Received message type 1b
model length: 6
Received model RM-495
Identifying...
Message sent: 0x1b / 0x0005
00 01 00 00 41                                  |     A           
Message sent: 0x1b / 0x0006
00 01 00 07 01 00                               |                 
Message received: 0x1b / 0x001a
01 39 00 01 00 01 41 14 00 10 33 35 34 32 32 33 |  9    A   354223
30 33 30 30 33 39 33 31 37 00                   | 030039317       
Received message type 1b
Received imei 354223030039317
Message received: 0x1b / 0x003e
01 39 00 08 00 01 58 38 00 31 56 20 30 35 2e 38 |  9    X8 1V 05.8
30 0a 31 38 2d 31 32 2d 30 38 0a 52 4d 2d 34 39 | 0 18-12-08 RM-49
35 0a 28 63 29 20 4e 6f 6b 69 61 20 20 20 20 20 | 5 (c) Nokia     
20 20 20 20 20 20 20 0a 4d 48 00 00 00 00       |         MH      
Received message type 1b
Received revision V 05.80
model length: 6
Received model RM-495
IMEI         : 354223030039317
Manufacturer : Nokia
Model        : RM-495
Product name : RM-495
Revision     : V 05.80
Serial device: closing device_





_Step 2:_


Then move on to smsd 

Configure smsd very simple as follows in [this  link ](http://wiki.gnokii.org/index.php/Smsd)
replace this line as


  **mysql -u root -p your-db-password smsgw < /usr/share/doc/gnokii-smsd-mysql/sms.tables.mysql.sql**

if you get access denied error


same thing in replace the sms line as below 

and start the sms daemon



**/usr/sbin/smsd -u root -d smsgw -c localhost -m mysql -p  your-db-password -b IN -f /var/log/smsdaemon.log**




 Now all inbox and outbox messages will be in

 **smsgw** database as **inbox **and **outbox** table :D

insert a tuple in outbox table to message to your friends 
as  
**insert into outbox (number,text) values('+91987654321', 'message from sms daemon ;-)');**

enjoy messaging by inserting values into database as above :)


to be continued ..........




















