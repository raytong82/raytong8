---
layout: post
title: elasticsearch troubleshooting
category: setup
tag:
  - elasticsearch
  - cors
---

**Problem:**

Browser from another origin cannot do request to elasticsearch

**Cause:**

CORS is enabled in elasticsearch since 1.6+

**Solution:**

update CORS config
{% highlight shell %}
http.cors.enabled: true
http.cors.allow-origin: "/.*/"
{% endhighlight %}