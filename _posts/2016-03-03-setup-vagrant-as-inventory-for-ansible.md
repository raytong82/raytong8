---
layout: post
title: Setup vagrant as inventory for ansible playbook
category: setup
tag:
  - ansible
  - vagrant
---

* There could be case when you could ssh to your vagrant box but receive ssh connection issue when running playbook against it. The problem is actually caused by the incorrect ssh configuration.

* You could actually check what configuration behind executing `vagrant ssh`.

* `cat .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory`

* Open vagrant inventory file and update the ssh configuration returned above, e.g.

{% highlight yaml %}
[vagrant]
vm1  ansible_host=127.0.0.1  ansible_ssh_port=2201 ansible_ssh_user='vagrant' ansible_ssh_private_key_file='C:/Users/raytong82/.vagrant.d/insecure_private_key'
{% endhighlight %}
