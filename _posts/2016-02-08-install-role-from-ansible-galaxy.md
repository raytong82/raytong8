---
layout: post
title: Install role from Ansible Galaxy
category: setup
tag:
  - ansible
  - ansible-galaxy
  - provision
---

* [find a role](https://galaxy.ansible.com/list#/roles)
  - could also search via command line `ansible-galaxy search java`
* install to your ansible playbook
  - `ansible-galaxy install geerlingguy.java --roles-path=provisioning/roles`
* verify role installed
  - `ansible-galaxy list`
  - folder created under specified path `--roles-path`