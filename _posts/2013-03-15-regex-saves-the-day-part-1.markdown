---
layout: post
title: "Regex saves the day - Part 1"
date: 2013-03-15 23:10
comments: true
categories: ["Regex","Ruby","Programming"]
---
> Regular expression is a good servant but a bad master (analogy to fire in real life)

Before Regular expressions 
-------------------------- 

I felt strange having regular expressions in my code. I felt it alien.
I was really afraid of regular expressions. I was comfortable using 
N number of lsplit,rsplit and gsubs which I could have done thru single regex.
I felt regex are old and it will be replaced by better and simpler libraries. 

Problems with regex - Source: xkcd 
-----------------------------------
![regex](http://imgs.xkcd.com/comics/perl_problems.png)

After Regular expressions
------------------------- 

[But I was proved wrong](http://blog.stevenlevithan.com/archives/10-reasons-to-learn-and-use-regular-expressions).
Regular expressions are not programming languages. 
They will never fade off like cobol, fortran or smalltalk. They are immortal entities
of programming. Regular expressions are set of notations which define specific patterns.
Curiosity to find why the regular expressions are named [regular expressions lead me here](http://www.grymoire.com/Unix/Regular.html).
Different programming langauges may add extra spice to Regex, but at its 
core it is one and the same. It has limited set of notations with complex behaviour. 

Using Regex everywhere - Source : xkcd 
---------------------------------------- 

![regex](http://imgs.xkcd.com/comics/regular_expressions.png)


Simpler the tools are, its complex to get the job done 
------------------------------------------------- 

> Everything should be made as simple as possible. But not simpler. (Einstein)

This patterns recurs everywhere. [Brainfuck](http://en.wikipedia.org/wiki/Brainfuck) is the minimalistic estoeric programming 
language with just six notations +, -, <, >, [, ]. But it is impossible ( or nearly impossible ) to 
write a product that could be shipped to cutsomers. [Ruby](http://en.wikipedia.org/wiki/Ruby_(programming_language)
implementation is internally very complicated
( [Starting from understanding class itself is a singleton object of class](http://stackoverflow.com/questions/4967556/ruby-craziness-class-vs-object) ).
But it has vast set of API's and notations wherein you could guess the method name you want.It is dynamic
and well suited for rapid application development, only because of it extensive notations 
and using convention over configuration approach everywhere.(as in RoR)

Regular expressions everywhere
-------------------------------
But regular expressions aren't horrible to the extent of Brainfuck. It is really usable and it can save the day 
if you use it like a pinch of salt.If you overdose it, you would spoil the dish. 

I realized they are not old, they are classic.I found support for regex everywhere.
From sql query we execute,to the editor I use (Vim) , to my favourite language ruby.

Regex in SQL queries
--------------------- 

```
SELECT file_names REGEXP "^*\.xlsx?" FROM file_tables;
```

This will fetch you all excel 2003,2007 documents from your file_tables databse. 

[Complete Reference here](http://dev.mysql.com/doc/refman/5.1/en/regexp.html)

Regex in Vim
------------ 

```
/\chttps?:\/\/.*?\/
```

This will search for all the urls which are either http or https, embedded in the html file.

[Complete Reference here](http://vimregex.com/)

Regex in Ruby
------------- 
```
excel_files = []

file_lists.each do |file|
  if file =~ /\.xlsx?$/i
    excel_files << file 
  end 
end 
```

> This will get all the xls and xlsx files from a directory.

```
file_lists.each do |file|
  if ['xls','xlsx','XLS','XLSX'].include? file.split('.').last
    excel_files << file 
  end 
end 
```

> This would be my approach without regex. 

The above array may even get worser if the extension has mixed cases 
like ['xls','xLS','Xls',...] or additionally I would do a downcase ( crazy right! ).

This is the first code which made me feel regex are cleaner because of no split and include? combination.
( which are now considered to be sins of a programmer )

Regex Notations 
--------------- 

- $ Notation here denotes any string ending with 
- ? denotes either zero or one times 
- i at end of regex after / denotes case insensitive match 
- escape any symbol with \
- . matches a single character
- [a-z] for small case match 
- [A-Z] for capital case 
- [0-9] or \d to match a digit
- [More notations here ..](http://www.regular-expressions.info/reference.html)

Brevity of Regex
---------------- 

```
> /\.xlsx?$/i
```

It clearly reads like a poem. 

> Any word which has a dot in between and if it has xls or xlsx 
> and if the word is ending with that, then report these culprits to your master,
> additionally do it case insensitive.

As you see above they remain same in all languages and in all tools.
They integrate seamlessly. This is the one tool that works universally the same.

Regex implementations 
--------------------- 

There are different debates on implementation of regex. Regex implementation in 
normal programming languages seems to be very slow compared to Thompson NFA.
It is in the difference of milliseconds and microseconds. Which means we don't have to worry much about.
If you are curious about these [you can refer here](http://swtch.com/~rsc/regexp/regexp1.html)

There are some minimal set of [Thompson NFA in re2 module of python](https://github.com/facebook/pyre2).
You can experiment once you master regex.

Regex are bad masters
--------------------- 

It seems regular expressions are cool. Then why can't all the string manipulations 
and complex logics combined into single regular expression. The one capsule which
cures all the disease. Like the number 42 which answers all the questions of [life ,
universe and everything.](http://en.wikipedia.org/wiki/Answer_to_The_Ultimate_Question_of_Life,_the_Universe,_and_Everything#Answer_to_the_Ultimate_Question_of_Life.2C_the_Universe.2C_and_Everything_.2842.29)

Readablity Problems in regex
---------------------------- 

The main reason is readablity. In the world of collaborative coding everyone should be 
able to understand the code and readablity is important tradeoff than all other factors ( like optimisation , LOC , etc. ).
[In codinghorror blog](http://www.codinghorror.com/blog/2005/02/regex-use-vs-regex-abuse.html)
Jeff mentioned about this [megamoth](http://www.codinghorror.com/blog/2012/07/new-programming-jargon.html) regular expressions.

Bad construction of regex
------------------------- 

There are some greedy notations in regex which can collapse all your assumptions.
In regex specificaly * is a greedy operator. If you don't know the proper end of 
the string and just match it with * it will fetch all the literals it can till the end.
If you have enabled extended and multiline search then it is still disastrous and at some 
point it might hang.

One clever trick I saw people using are using Timouts. 

```
  Timout exceeds more than 1 minute exit this block
    Regular expression block
  end 
```

This may avoid our program from being hung but our ultimate goal 
of matching may fail due to these types og regex.Other way is 
digging a level deep into regex and fix the actual problem. 
( which is quiet painfull in regex )

Consider an example:

> Vampires bites zombies.Zombies bites Mummies.Mummies bites Vampires.

If you are interested in who bite whom then you would build a regex like:

```
  result = sentence.match /(.*)bites(.*)/

  puts "Parasite: #{result[1]}"
  # => Parasite: Vampires bites zombies.Zombies bites Mummies.Mummies bites

  puts "Victim: #{result[2]}"
  # => Victimit: Vampires
```

This is not what we wanted.Parasite has fetched the whole sentenct till it finds the last one.
Yep as the name suggests it is definitely greedy.I usually test with very limited 
or no test sometimes and put this types of regex on production.

Testing Regex with Bad test case 
-------------------------------

My test case would be 

```
  Test String: "X bites Y"
  Parasite: X
  Victim: Y 
```

Eureka! it works. I would happily commit it. 
But on some worst case if we find 'bites' at end of 
a 2 TB log file imagine what would be the matching string.
Hence exhaustive testing each regex as an unit and 
as a whole if they are combined with '|' would be necessary.
We should be expecting the unexpected.

(?) The Lion tamer
------------------ 

Inorder to attenuate the greediness of this '*' we can use '?' at end of it.

```
  result = sentence.match /(.*?)bites(.*?)\/
``` 

This would be the non-greedy version of our regex.

Additional Language features
----------------------------- 

There are some more syntactic sugar added to regex in ruby 1.9.2 
which would makes things more simple with hashed matches.

```
  result = sentence.match /(?<Parasite>.*?)bites(?<Victim>.*?)\/
  result.inspect 
  { "Parasite": "X" , "Victim": "Y"}
```

Catastrophic Backtracking - weird problems in Regex
------------------------- 

This may occur while we use regex negligently and redundantly.
[This article](http://www.regular-expressions.info/catastrophic.html) clearly 
explains the possible cases on how a naive programmer could misue regex.

Consider an Example:

* We want to extract time from a file. 
* patterns can be 7am , 12pm , etc 
* Instead of the pattern \d\d?(am|pm) if we came up with wrong Regex /(\d+)+(am|pm)/ then this regular expression will never exit.

Try running [this regex on rubular](http://rubular.com/r/DTz3YI1EWB).

```
  /(\d+)+am/
  # on string: "123332432424524524542542363465326524" which doesn't have am or pm at the end.
```

[Rubular](www.rubular.com) is really a good site to start playing with wide variety of regular expressions.

Regex for web-developers
------------------------ 

Most of my ignorance to regex for a long time was due to my wrong assumptions. 
I assumed regex are for nerds who write new programming languages. Geeks who 
optimizes the compiler instructions. Data scientists who dig deep into web logs 
and all sorts of unstructured big datas. May be I am true to some extent. 
Web-developers may not need to write a new regular expression parser but we really need 
some set of regex which occurs in our javascript validation day-to-day. 
[This post gives five basic regex which every regex programmer should know.](http://web.archive.org/web/20090318193321/http://immike.net/blog/2007/04/06/5-regular-expressions-every-web-programmer-should-know/)

