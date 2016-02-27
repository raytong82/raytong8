---
layout: post
title: Replace text with sed
category: programming
tag:
  - linux
  - unix
  - replace
  - text
  - sed
---

{% highlight shell %}
sed -i.bak s/$STRING_FROM/$STRING_TO/g $FILE
{% endhighlight %}
| Parameter | Description |
| --------- | ----------- |
| -i | inline replace |
| .bak | Optional. If provided, create backup file with that extension |
| STRING_FROM | text to be replaced from |
| STRING_TO | text to be substituted to |
| FILE | file to be worked on |