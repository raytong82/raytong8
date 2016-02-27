---
layout: post
title: Resize unix mount size
category: setup
tag:
  - linux
  - unix
  - mount
  - resize
  - vm
---

*  make sure no process accessing /home directory
{% highlight shell %}
lsof /home
{% endhighlight %}
* unmount drive
{% highlight shell %}
unmount /home
{% endhighlight %}
* filesystem check
{% highlight shell %}
e2fsck -f /dev/mapper/vg_alice-lv_home
{% endhighlight %}
* shrink it to something enough
{% highlight shell %}
resize2fs /dev/mapper/vg_alice-lv_home 100G
{% endhighlight %}
* reduce the logical volumn of filesystem - slightly bigger than what typed above
{% highlight shell %}
lvresize -L 110G /dev/mapper/vg_alice-lv_home
{% endhighlight %}
* filesystem check
{% highlight shell %}
e2fsck -f /dev/mapper/vg_alice-lv_home
{% endhighlight %}
* mount the drive back
{% highlight shell %}
mount /home
{% endhighlight %}
* resize to the total size remained
{% highlight shell %}
lvextend -L +100%FREE /dev/mapper/vg_alice-lv_root
{% endhighlight %}
* enlarge to the size allocated
{% highlight shell %}
resize2fs /dev/mapper/vg_alice-lv_root
{% endhighlight %}
