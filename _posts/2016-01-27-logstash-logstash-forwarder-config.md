---
layout: post
title: logstash / logstash-forwarder configuration
category: setup
tag:
  - logstash
  - logstash-forwarder
  - elasticsearch
  - grok
---

* generate a certificate for handshaking
{% highlight shell %}
openssl req -x509  -batch -nodes -newkey rsa:2048 -keyout lumberjack.key -out lumberjack.crt -subj /CN=*
{% endhighlight %}
* config for logstash-forwarder
{% highlight shell %}
{
  "network": {
    "servers": [ "localhost:5043" ],
    "timeout": 15,
    "ssl certificate": "/dev/logstash_cert/logstash-forwarder.crt",
    "ssl key": "/dev/logstash_cert/logstash-forwarder.key",
    "ssl ca": "/dev/logstash_cert/logstash-forwarder.crt"
  },
  "files": [
    {
        "dead time": "15m",
        "fields": {
            "type": "app_logs"
        },
        "paths": [
            "/dev/temp/*.out"
        ]
    }
   ]
}
{% endhighlight %}
* config for logstash
{% highlight shell %}
input {
  lumberjack {
    port => 5043
    type => "logs"
    ssl_certificate => "/dev/logstash_cert/logstash-forwarder.crt"
    ssl_key => "/dev/logstash_cert/logstash-forwarder.key"
  }
}
output {
  elasticsearch {
    hosts => ["localhost:9200"]
  }
}
{% endhighlight %}

**Materials**

- [grok filter for parsing](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html)

- [some pattern contributed by community](https://github.com/logstash-plugins/logstash-patterns-core/tree/master/patterns)

- [online grok debugger](https://grokdebug.herokuapp.com/)