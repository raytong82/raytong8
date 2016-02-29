---
layout: post
title: Logstash lumberjack pipeline is blocked
category: setup
tag:
  - elasticsearch
  - logstash
  - lumberjack
---

**Problem**

{% highlight javascript %}
{:timestamp=>"2016-02-29T05:14:19.433000+0000", :message=>"CircuitBreaker::rescuing exceptions", :name=>"Lumberjack input", :exception=>LogStash::SizedQueue
Timeout::TimeoutError, :level=>:warn}
{:timestamp=>"2016-02-29T05:14:19.438000+0000", :message=>"Lumberjack input: The circuit breaker has detected a slowdown or stall in the pipeline, the input
{:timestamp=>"2016-02-29T05:14:13.830000+0000", :message=>"Lumberjack input: the pipeline is blocked, temporary refusing new connection.", :level=>:warn}
{% endhighlight %}

**Cause**

Output (e.g. elasticsearch) target may be busy (cluster status red) on processing data.

**Solution**

Verify output target is working fine
* `curl -XGET http://localhost:9200/_cluster/health`
