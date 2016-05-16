---
layout: post
title: snapshot and restore elasticsearch indices
category: setup
tag:
  - elasticsearch
  - backup
  - restore
---

*On the source machine*

1. List available snapshot repository
{% highlight conf linenos %}
curl -XGET http://localhost:9200/_snapshot
{% endhighlight %}

2. Create snapshot repository (if not yet created)
{% highlight conf linenos %}
curl -XPUT http://localhost:9200/_snapshot/my_snapshot_repository -d'
{
  "type": "fs",
  "settings": {
     "location": "/data/backups/my_snapshot_repository/"
  }
}'
{% endhighlight %}

3. List all snaphosts within repository
{% highlight conf linenos %}
curl -XGET http://localhost:9200/_snapshot/my_snapshot_repository/_all
{% endhighlight %}

4. Create snapshot
{% highlight conf linenos %}
curl -XPUT http://localhost:9200/_snapshot/my_snapshot_repository/20160516
{% endhighlight %}

5. Check snapshot status
{% highlight conf linenos %}
curl -XGET http://localhost:9200/_snapshot/my_snapshot_repository/20160516/_status
{% endhighlight %}

*On the target machine*

6. Repeat step 1 and 2 if required

7. Restore from the snapshot (make sure indices are closed)
{% highlight conf linenos %}
curl -XPOST http://localhost:9200/_snapshot/my_snapshot_repository/20160516/_restore
{% endhighlight %}
