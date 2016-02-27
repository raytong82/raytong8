---
layout: post
title: Install Ansible on Cygwin
category: setup
tag:
  - ansible
  - cygwin
  - pip
  - python
---

*  Install gcc (C complier) for Cygwin
{% highlight shell %}
wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py
easy_install pip
pip install ansible
{% endhighlight %}