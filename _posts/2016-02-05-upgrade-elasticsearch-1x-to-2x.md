---
layout: post
title: Upgrade elasticsearch from 1.x to 2.x
category: setup
tag:
  - elasticsearch
  - logstash
  - elk
  - upgrade
---

[elasticsearch official 1.6 upgrade guide](https://www.elastic.co/guide/en/elasticsearch/reference/1.6/setup-repositories.html)

Recommend to use Sense instead of CURL which has intellisense and formatting

* [backup data using snapshot and restore](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-snapshots.html)
* retrieve cluster setting
{% highlight shell %}
GET _cluster/settings
{% endhighlight %}
* disable shard reallocation (speed up update)
{% highlight shell %}
PUT _cluster/settings
{
    "transient": {
        "cluster.routing.allocation.enable" : "none"
    }
}
{% endhighlight %}
* verify cluster setting update
* perform flush (if from 1.6+)
{% highlight shell %}
POST /_flush/synced
{% endhighlight %}
* shutdown local node
* upgrade elasticsearch package
{% highlight shell %}
yum upgrade elasticsearch
{% endhighlight %}
* update config
  - Comment out deprecated config CONF_FILE in /etc/sysconfig/elasticsearch and move the yaml file if needed
  - remove unsupported plugin (if needed)
{% highlight shell %}
/usr/share/elasticsearch/bin/plugin remove HQ
{% endhighlight %}
  - enable access from other ips
{% highlight shell %}
http.cors.enabled: true
http.cors.allow-origin: "*"
network.bind_host: 0.0.0.0
network.publish_host: <<your_external_address>>
{% endhighlight %}
* restart service
* re-enable shard allocation
{% highlight shell %}
PUT _cluster/settings
{
    "transient": {
        "cluster.routing.allocation.enable" : "all"
    }
}
{% endhighlight %}