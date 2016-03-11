---
layout: post
title: Install Datastax Cassandra with OpsCenter
category: setup
tag:
  - datastax
  - cassandra
---

* make sure you can find the package in your yum repo
{% highlight shell %}
yum search dse opscenter
{% endhighlight %}
* install the package
{% highlight shell %}
yum install dse-full
yum install opscenter
{% endhighlight %}
* create a dedicated data and commit_log directory if needed
  - it would be good practice to have the directory on different physical disk to avoid competing IO resources (unless you use SSD)
* edit cassandra configuration
{% endhighlight %}
vi /etc/dse/cassandra/cassandra.yaml
{% highlight shell %}
* edit cassandra JVM configuration if needed
{% endhighlight %}
vi /etc/dse/cassandra/cassandra-env.sh
{% highlight shell %}
* edit data-agent configuration pointing to opscenter host
{% highlight shell %}
vi /var/lib/datastax-agent/conf/address.yaml
{% endhighlight %}
* edit opscenter config cassandra cluster
{% highlight shell %}
vi /etc/opscenter/clusters/cluster_name.conf
{% endhighlight %}
