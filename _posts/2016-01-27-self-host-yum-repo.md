---
layout: post
title: Host your own yum repository
category: setup
tag:
  - linux
  - unix
  - yum
  - repo
---

* Check package is available
{% highlight shell %}
yum list available $package --showduplicates
{% endhighlight %}
* Create/Update the remote yum repo
{% highlight shell %}
/etc/yum.repo.d/$repo_name.repo
{% endhighlight %}
* Sync the package from remote repo
{% highlight shell %}
sudo reposync -r $repo_name -p $self_repo_path -l -n
{% endhighlight %}
* Update repository for new packages
{% highlight shell %}
sudo createrepo -q --update --workers 3 $self_repo_path/$repo_name>>
{% endhighlight %}
* Check package is updated
{% highlight shell %}
yum list available $package --showduplicates
{% endhighlight %}
* Refresh yum caches repository list
{% highlight shell %}
yum makecache
{% endhighlight %}