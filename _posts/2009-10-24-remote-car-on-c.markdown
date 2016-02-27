---
comments: true
date: 2009-10-24 01:28:12
layout: post
slug: remote-car-on-c
title: Remote car on 'C'
wordpress_id: 155
categories:
- Projects
---

remote car on c

/** This is a basic hardware program in c interfacing a remote car
here consider a basic table

lpt port has pin 2-9 for data we can send data to it by calling

here we use only data pins 2,3,4,5 only

syntax : outport(port_address,number);

port address is 0×378 for lpt 2 and 0×3bc for lpt 1

well now move towards the code concentrate on lowest 4 bits

number data operation

1 0001 right steer
2 0010 left steer
4 0100 forward
8 1000 backward
5 0101 right steering + forward (right turn forward)
10 1010 left steering + backward (left turn backward)
6 0110 right steering + backward (right turn back)
9 1001 left steering + forward(left turn front)

this is the logic of code
*/

#include
#include
#include
#include

void circle() //to move in circular path
{int i=0;
while(!getch())
{
outport(0×3bc,5); // 5 = 0101 means on the right and on the forward

}
}

void rectangle()
{
int i=0;
coutl;cin>>b;
while(!getch())
{
outport(0×3bc,4); // forward
i++;
delay(1000*b);
outport(0×3bc,5); // right steer
delay(1000);
outport(0×3bc,4); // forward
delay(1000*l);
}
}

void zigzag()
{
while(!getch())
{
outport(0×3bc,5); //right forward
delay(3000);
outport(0×3bc,9); // left forward
delay(3000);

}
}

void manual()

{char c=’a';
while(c!=’x')
{
clear();
cout<<endl<<endl<<" use move keys for direction 'x' to exit";
c=getch();
if(c=='^[[A')
{
outportb(0x3bc,1);
delay(1000);
}
else if(c=='^[[B')
{
outport(0x3bc,4);
}
else if(c=='^[[C')
{
outportb(0x3bc,2);
delay(1000);
}
else if(c=='^[[D')
{
outportb(0x3bc,8);
delay(1000);
}
}
}

void manual(char choice, int time) // oveloaded fn for creative
{char c;
c=choice;
while(c!='x')
{
clear();

if(c=='^[[A')
{
outportb(0x3bc,1);
delay(time*1000);
}
else if(c=='^[[B')
{
outport(0x3bc,4);
delay(time*1000);
}
else if(c=='^[[C')
{
outportb(0x3bc,2);
delay(time*1000);
}
else if(c=='^[[D')
{
outportb(0x3bc,8);
delay(time*1000);
}
}
}
void creative()
{
char str[20];
int i=0,n[20];
while(str[i]!='x')
{
coutstr[i];
coutn[i];
i++;
}
i=0;
while(str[i]!=’x')
{
manual(str[i],n[i]);
}
}

void automatic()
{
clear(); int g,h;
cout<<" enter 1 to circle "<<endl<<" 2 to rectangle move"g;

if(g==1)
{
circle();
}
else if(g==2)
{
rectangle();
}
else if(g==3)
{
zigzag();
}
else if(g==4)
{
creative();
}
}

void clear()
{
int n=0;
while(n<300)
{
cout<<endl;
n++;
}
}

void menu()
{
clear(); int ch;
cout<<" 1 for manual"<<endl<<" 2 for automatic "ch;
if(ch==1)
{
manual();
}
else if(ch==2)
{
automatic();
}
}
/* now its time to open your car’s remote
step 1: find the wires which goes for right ,left forward backward
step 2: attach lpt ports pin 2 to right 3 to left 4 to forward 5 to backward and ground to pin 23
warning ! remove external batteries from remote which may leak at times
step 3: run this code and enjoy racing !

thank you !
by karthik selvakumar B

mail bugs to karthikselvakumar@tce.edu
*/

