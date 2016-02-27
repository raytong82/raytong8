---
layout: post
title: Install Kibana 4.x
category: setup
tag:
  - elasticsearch
  - kibana
  - elk
---

* [download Kibana](https://www.elastic.co/downloads/kibana)
* extract the tarball gzip file in target machine
{% highlight shell %}
tar -zxvf kibana-4.1.4-linux-x64.tar.gz
{% endhighlight %}
* change the folder owner / group owner same as daemon user
{% highlight shell %}
chmod -R $user:$user $kibana_folder
{% endhighlight %}
* run Kibana
{% highlight shell %}
./bin/kibana
{% endhighlight %}
* access via browser
{% highlight shell %}
http://localhost:5601
{% endhighlight %}

[run Kibana as unix service](https://github.com/cjcotton/init-kibana)