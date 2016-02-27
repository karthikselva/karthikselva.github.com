src = /{% include_code\s+([A-Za-z0-9\._]+)\s+%}/

files = Dir['_posts/*']

files.each do |e|
    content =nil 
    File.open(e) do |f|
    	content = f.read 
    end



    dest = content.gsub(src) {|m|
    	"{% highlight ruby %}
       {% include {{page.permalink}}/downloads/code/#{$1} %}
    {% endhighlight %}"
	}

    next if dest.eql?(content)
    File.open(e,'w') do |f|
    	f.write dest
    end
    p dest 
 end