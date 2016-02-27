---
layout: post
title: Upgrade logstash from 1.x to 2.x
category: setup
tag:
  - elasticsearch
  - logstash
  - upgrade
---

*  stop logstash
* remove logstash-contrib (if installed, not needed since 1.5+)
{% highlight shell %}
yum remove logstash-contrib
{% endhighlight %}
* upgrade logstash
{% highlight shell %}
yum upgrade logstash
{% endhighlight %}
* update config
  - [hosts](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-elasticsearch.html#plugins-outputs-elasticsearch-hosts)
  - [template overwrite](https://www.elastic.co/guide/en/logstash/current/_upgrading_logstash_and_elasticsearch_to_2_0.html)
{% highlight shell raw %}
elasticsearch {
  bind_host => "127.0.0.1"
  protocol => http
}

to

elasticsearch {
  hosts => ["127.0.0.1:9200"]
  template_overwrite => true
}
{% endhighlight %}
* verify config ok
{% highlight shell %}
logstash --configtest
{% endhighlight %}
* start logstash
