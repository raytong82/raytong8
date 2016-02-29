---
layout: post
title: elasticsearch failed to allocate shard for indices
category: setup
tag:
  - elasticsearch
  - shard
---

**Problem**

{% highlight shell linenos %}
[2016-02-29 04:46:34,761][WARN ][action.bulk              ] [localhost] unexpected error during the primary phase for action [indices:data/write/bulk[s]], request [shard 
bulk {[logstash-2016.02.27][1]}]
[logstash-2016.02.27] IndexNotFoundException[no such index]{% endhighlight %}

**Cause**

elasticsearch failed to allocate shard for the target index

**Solution**

1. Enable allocate shard for the cluster (if previously disabled)
{% highlight conf linenos %}
curl -XPUT http://localhost:9200/_cluster/settings -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "all"
  }
}'
{% endhighlight %}

2. or explicitly allocate shard per index
{% highlight conf linenos %}
curl -XPUT http://localhost:9200/_cluster/reroute -d'
{
    "commands": [
        {
            "allocate": {
                "index": "logstash-2015.10.12",
                "shard" : 0, 
                "node": "rBj1nZMWSKCaxWxYcq-j9Q"                    
            }
        }
    ]
}'
{% endhighlight %}

* `curl -XGET http://localhost:9200/_cat/shards` to find the shard information for indices
* `curl -XGET http://localhost:9200//_nodes` to find the node information
