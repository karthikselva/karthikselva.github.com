---
layout: post
title: "Mischeivous bang(!) operator in Ruby"
date: 2013-03-15 16:02
comments: true
categories: [Ruby,Rails,Programming]
---

This is a typical ruby programmer's style of overwriting on the same object:

    array = [1.2 , 2.7] 
    array.map!(&:floor)

This will modify my same object *array*.

    puts array
    #=> [1,2]

Similarly, the below code removes **nil** values from an array :

    array = [1 , 2, nil, 3, nil, 5]
    new_array = array.compact
    puts new_array
    #=> [1,2,3,5]

But if we try to use bang operator for compact we will end up with nil for no nil value cases in an array.

    array = [1 , 2, 3] # No nil values present
    array.compact!
    puts array
    #=> nil

This can easily escapes from our eyes while debugging the code.

http://ruby-doc.org/core-1.9.3/Array.html#method-i-collect-21 